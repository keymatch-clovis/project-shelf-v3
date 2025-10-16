import 'dart:async';
import 'dart:math';

import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/main.dart';
import 'package:sqflite/sqflite.dart';

final class LoadV2DatabaseUseCase extends UseCase<String, Result> {
  final _productService = getIt.get<ProductService>();
  final _invoiceService = getIt.get<InvoiceService>();
  final _customerService = getIt.get<CustomerService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  @override
  FutureOr<Result> exec(String filePath) async {
    logger.d('Loading V2 database');

    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    // NOTE: WE'LL DO EVERYTHING HERE, THIS IS NOT CORRECT
    //  But we don't have enough time to move this to services, repositories,
    //  etc. So, we'll open everything from here. We need to fix this.

    final db = await openReadOnlyDatabase(filePath);

    // Load cities.
    await _customerService.deleteAll();

    final customers = await db.query('customer');

    // In the version 2, we were using UUID, now we are using ID, so we need to
    // map that. We need this value to merge invoices and products, etc.
    final customerMap = <String, int>{};

    for (final customer in customers) {
      final name = customer['name'] as String;
      final phone = customer['phone'] as String;
      final address = customer['address'] as String;
      final businessName = customer['businessName'] as String?;
      // NOTE: These are loaded in the same order in this V2 version, so we can
      //  be fairly sure the ID contained there is the same as the one used here.
      //  so we don't need to load the cities as well.
      final cityId = customer['city_row_id'] as int;

      try {
        final id = await _customerService.create(
          Customer(
            name: name,
            phoneNumber: phone,
            address: address,
            businessName: businessName,
            cityId: cityId,
          ),
        );

        customerMap[customer['uuid'] as String] = id;
        // ignore: empty_catches
      } catch (e) {}
    }

    // Load products.
    await _productService.deleteAll();
    final products = await db.query('product');

    // In the version 2, we were using UUID, now we are using ID, so we need to
    // map that. We need this value to merge invoices and products, etc.
    final productMap = <String, int>{};

    for (final product in products) {
      final name = product['name'] as String;
      final defaultPrice = Money.fromIntWithCurrency(
        ((product['price'] as int) / 100).toInt(),
        defaultCurrency,
      );
      final stock = product['stock'] as int;

      try {
        final id = await _productService.create(
          Product.fromMoney(
            defaultCurrency,
            name: name,
            defaultPrice: !defaultPrice.isNegative
                ? defaultPrice
                : defaultCurrency.zero,
            stock: stock >= 0 ? stock : 0,
          ),
        );

        productMap[product['uuid'] as String] = id;
        // ignore: empty_catches
      } catch (e) {
        final id = await _productService.create(
          Product.fromMoney(
            defaultCurrency,
            // We need to do this, as there are some products that have the
            // same name... silly me! Maybe that won't happen here. :3
            name: '$name ${randomHexString(5)}',
            defaultPrice: !defaultPrice.isNegative
                ? defaultPrice
                : defaultCurrency.zero,
            stock: stock >= 0 ? stock : 0,
          ),
        );

        productMap[product['uuid'] as String] = id;
      }
    }

    // Load invoices
    await _invoiceService.deleteAll();
    final invoices = await db.query('invoice');
    final invoiceProducts = await db.query('product_invoice');

    for (final invoice in invoices) {
      final number = invoice['number'] as int;
      final date = DateTime.fromMillisecondsSinceEpoch(
        (invoice['date'] as int) * 1000,
      );
      final uuid = invoice['uuid'];

      final entity = Invoice(
        defaultCurrency,
        number: number,
        date: date,
        customerId: customerMap[invoice['customer_uuid'] as String]!,
        remainingUnpaidBalance: defaultCurrency.zero,
      );

      for (final invoiceProduct in invoiceProducts) {
        if (uuid == invoiceProduct['invoice_uuid'] as String) {
          final productId =
              productMap[invoiceProduct['product_uuid'] as String]!;
          final unitPrice = Money.fromIntWithCurrency(
            invoiceProduct['price'] as int,
            defaultCurrency,
          );
          final quantity = invoiceProduct['count'] as int;
          entity.addProduct(
            productId: productId,
            unitPrice: unitPrice,
            quantity: quantity,
            // We need to do this, as this part of the logic and business rules is
            // not finished! Silly me!
            stock: double.maxFinite.toInt(),
          );
        }
      }

      await _invoiceService.create(entity);
    }

    return Result.ok(unit);
  }
}

// https://stackoverflow.com/questions/73309585/how-do-i-generate-random-bytes-and-convert-do-hex-using-dart
String randomHexString(int length) {
  Random random = Random();
  StringBuffer buffer = StringBuffer();

  for (var i = 0; i < length; i++) {
    buffer.write(random.nextInt(16).toRadixString(16));
  }
  return buffer.toString();
}
