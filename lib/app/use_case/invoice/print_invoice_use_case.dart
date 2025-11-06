import 'dart:typed_data';

import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/domain/service/file_service.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/app/service/string_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_logo.dart';
import 'package:project_shelf_v3/domain/service/image_service.dart';
import 'package:project_shelf_v3/injectable.dart';

final class PrintInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _printerService = getIt.get<PrinterService>();
  final _productService = getIt.get<ProductService>();
  final _companyInfoService = getIt.get<CompanyInfoService>();
  final _invoiceService = getIt.get<InvoiceService>();
  final _customerService = getIt.get<CustomerService>();
  final _cityService = getIt.get<CityService>();
  final _imageService = getIt.get<ImageService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();
  final _assetService = getIt.get<AssetService>();

  /// If the [companyInfoRequest] parameter is set, it means the user wants to
  /// override the company info set by default.
  Future<void> exec({
    required Id invoiceId,
    required PrinterInfoRequest printerInfoRequest,
    required String locale,
  }) async {
    final stringService = await getIt.getAsync<StringService>(param1: locale);

    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final companyInfo = await _companyInfoService
        .get()
        .map((it) {
          assert(it.length <= 1);
          return it.single;
        })
        .then((it) => it.unwrap());

    final Uint8List logoBytes = await companyInfo.logo
        .map((it) => it.bytes)
        .unwrapOrElseAsync(() => _assetService.getDefaultLogo());

    final invoiceLogo = await InvoiceLogo.create(
      imageService: _imageService,
      bytes: logoBytes,
    );

    final invoice = await _invoiceService.findWithId(invoiceId);
    final customer = await _customerService
        .findWithId(invoice.customerId)
        .unwrap();

    final city = await _cityService.findWithId(customer.cityId).unwrap();

    final companyDocument = stringService.getInvoiceDocumentString(
      companyInfo.document.unwrap(),
    );

    final invoiceProducts = await _invoiceService
        .findInvoiceProducts(invoice.id, currency: defaultCurrency)
        // Unwrap the result.
        // NOTE: We should handle the error here, if it exists. For now, this
        // should not error, so it is fine.
        .unwrap();

    final printerInvoiceProducts = await Stream.fromIterable(invoiceProducts)
        .asyncMap((it) async {
          final product = await _productService.findWithId(it.productId);

          return InvoiceProductPrintRequest(
            name: product.name,
            unitPrice: it.unitPrice.toString(),
            quantity: it.quantity.toString(),
            total: it.total.toString(),
          );
        })
        .toList();

    final remainingUnpaidBalance = invoice.remainingUnpaidBalance.isNonZero
        ? invoice.remainingUnpaidBalance.toString()
        : null;

    _logger.d('Printing invoice');
    _printerService.printInvoice(
      PrintInvoiceRequest(
        invoiceLogoBytes: invoiceLogo.bytes,
        companyDocument: companyDocument,
        companyPhone: companyInfo.phone.unwrap(),
        companyEmail: companyInfo.email.unwrap(),
        invoiceCustomer: customer.name,
        invoiceCity: city.name,
        invoiceDate: Jiffy.parseFromDateTime(invoice.date).yMd,
        printerInfoRequest: printerInfoRequest,
        totalValue: invoice.getTotal(invoiceProducts).toString(),
        invoiceProducts: printerInvoiceProducts,
        remainingUnpaidBalance: remainingUnpaidBalance,
        productLiteral: stringService.getShelfString(ShelfString.PRODUCT),
        unitAbbreviatedLiteral: stringService.getShelfString(
          ShelfString.UNIT_ABBREVIATED,
        ),
        valueLiteral: stringService.getShelfString(ShelfString.VALUE),
        totalLiteral: stringService.getShelfString(ShelfString.TOTAL),
        remainingUnpaidBalanceLiteral: stringService.getShelfString(
          ShelfString.REMAINING_UNPAID_BALANCE,
        ),
      ),
    );
  }
}
