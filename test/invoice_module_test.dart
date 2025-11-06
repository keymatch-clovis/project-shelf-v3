import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:jiffy/jiffy.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/dto/create_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_request.dart';
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/get_invoices_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/update_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  final faker = Faker();

  setUpAll(() async {
    await configureDependencies(injectable.Environment.test);

    // NOTE: This is something I don't really know. We're using here a use case
    // from a totally diferent and unrelated module. If this use case fails, it
    // means the city module is failing, and not the customer module.
    // But, without the customer module working, this one can't work, so it is
    // ok?
    //
    // NOTE: I have done a little research, and these are considered almost like
    // E2E testing, so it seems fine.
    await getIt.get<LoadDefaultDataUseCase>().exec();
  });

  test('Creates invoice', () async {
    // Take the first city, we don't really care about which one for the test.
    final city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final defaultCurrency = await getIt
        .get<GetAppPreferencesUseCase>()
        .exec()
        .then((it) => it.defaultCurrency);

    final customer = await getIt
        .get<CreateCustomerUseCase>()
        .exec(
          CreateCustomerRequest(
            name: faker.randomGenerator.string(10),
            businessName: Some(faker.randomGenerator.string(10)),
            address: Some(faker.randomGenerator.string(10)),
            phoneNumber: Some(faker.randomGenerator.string(10)),
            cityId: city.id.unwrap(),
          ),
        )
        .then((it) => it.unwrap());

    final product = await getIt
        .get<CreateProductUseCase>()
        .exec(
          CreateProductRequest(
            name: faker.randomGenerator.string(10),
            defaultPrice: Some(Money.fromIntWithCurrency(10, defaultCurrency)),
            purchasePrice: Some(Money.fromIntWithCurrency(10, defaultCurrency)),
            stock: Some(10),
          ),
        )
        .unwrap();

    final invoiceProductRequest = CreateInvoiceProductRequest(
      productId: product.id.unwrap(),
      unitPrice: product.defaultPrice,
      quantity: 5,
    );

    final request = CreateInvoiceRequest(
      date: DateTime.now(),
      customerId: customer.id.unwrap(),
      invoiceProducts: [invoiceProductRequest],
      remainingUnpaidBalance: Some(
        Money.fromIntWithCurrency(10, defaultCurrency),
      ),
    );

    final invoice = await getIt
        .get<CreateInvoiceUseCase>()
        .exec(request)
        .unwrap();

    final invoiceProducts = await getIt
        .get<FindInvoiceProductsUseCase>()
        .exec(invoice.id)
        .unwrap();

    expect(invoice.date, request.date);
    expect(invoice.customerId, request.customerId);
    expect(invoiceProducts.isNotEmpty, true);
    expect(invoice.remainingUnpaidBalance.isNonZero, true);
  });

  test('Gets invoices', () async {
    final invoices = await getIt.get<GetInvoicesUseCase>().exec().first;

    expect(invoices.isNotEmpty, true);
  });

  test('Updates invoice', () async {
    // Take the first city, we don't really care about which one for the test.
    final city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final defaultCurrency = await getIt
        .get<GetAppPreferencesUseCase>()
        .exec()
        .then((it) => it.defaultCurrency);

    final customer = await getIt
        .get<CreateCustomerUseCase>()
        .exec(
          CreateCustomerRequest(
            name: faker.randomGenerator.string(10),
            businessName: Some(faker.randomGenerator.string(10)),
            address: Some(faker.randomGenerator.string(10)),
            phoneNumber: Some(faker.randomGenerator.string(10)),
            cityId: city.id.unwrap(),
          ),
        )
        .then((it) => it.unwrap());

    final product = await getIt
        .get<CreateProductUseCase>()
        .exec(
          CreateProductRequest(
            name: faker.randomGenerator.string(10),
            defaultPrice: Some(Money.fromIntWithCurrency(10, defaultCurrency)),
            purchasePrice: Some(Money.fromIntWithCurrency(10, defaultCurrency)),
            stock: Some(0),
          ),
        )
        .unwrap();

    final invoice = await getIt
        .get<CreateInvoiceUseCase>()
        .exec(
          CreateInvoiceRequest(
            date: DateTime.now(),
            customerId: customer.id.unwrap(),
            invoiceProducts: [
              CreateInvoiceProductRequest(
                productId: product.id.unwrap(),
                unitPrice: product.defaultPrice,
                quantity: 100,
              ),
              CreateInvoiceProductRequest(
                productId: product.id.unwrap(),
                unitPrice: product.defaultPrice,
                quantity: 100,
              ),
            ],
            remainingUnpaidBalance: Some(
              Money.fromIntWithCurrency(10, defaultCurrency),
            ),
          ),
        )
        .unwrap();

    final invoiceProducts = await getIt
        .get<FindInvoiceProductsUseCase>()
        .exec(invoice.id)
        .unwrap();

    // We need to create two products for the invoice edition. One, to update
    // it, and another one, to be deleted.
    final invoiceProductToUpdate = invoiceProducts.first;

    final invoiceProductRequests = [
      UpdateInvoiceProductRequest(
        id: invoiceProductToUpdate.id,
        productId: invoiceProductToUpdate.productId,
        unitPrice: Some(Money.fromIntWithCurrency(60, invoice.currency)),
        quantity: Some(10),
      ),
      // This one will be created.
      UpdateInvoiceProductRequest(
        id: None(),
        productId: invoiceProductToUpdate.productId,
        unitPrice: Some(Money.fromIntWithCurrency(40, invoice.currency)),
        quantity: Some(70),
      ),
    ];

    final updateRequest = UpdateInvoiceRequest(
      id: invoice.id,
      date: Some(Jiffy.now().subtractDuration(Duration(days: 1)).dateTime),
      invoiceProducts: invoiceProductRequests,
      remainingUnpaidBalance: Some(
        Money.fromIntWithCurrency(20, invoice.currency),
      ),
    );

    final updatedInvoice = await getIt
        .get<UpdateInvoiceUseCase>()
        .exec(updateRequest)
        .unwrap();

    final updatedInvoiceProducts = await getIt
        .get<FindInvoiceProductsUseCase>()
        .exec(updatedInvoice.id)
        .unwrap();

    // These values must stay the same.
    expect(updatedInvoice.id == invoice.id, true);
    expect(updatedInvoice.number == invoice.number, true);
    expect(updatedInvoice.customerId == invoice.customerId, true);
    // These can change.
    expect(updatedInvoice.date != invoice.date, true);
    expect(
      updatedInvoice.remainingUnpaidBalance != invoice.remainingUnpaidBalance,
      true,
    );

    // Expect that we only have 2 invoice products; the one to be created, and
    // the one to be updated.
    expect(updatedInvoiceProducts.length, 2);

    for (final newProduct in updatedInvoiceProducts) {
      final oldProduct = Option.from(
        invoiceProducts.where((it) => it.id == newProduct.id).singleOrNull,
      );

      oldProduct.map((it) {
        expect(newProduct.unitPrice != it.unitPrice, true);
        expect(newProduct.quantity != it.quantity, true);
      });
    }
  });
}
