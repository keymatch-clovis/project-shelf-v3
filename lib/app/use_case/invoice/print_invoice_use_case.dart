import 'dart:typed_data';

import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/domain/service/file_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
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
  final _fileService = getIt.get<FileService>();
  final _invoiceService = getIt.get<InvoiceService>();
  final _customerService = getIt.get<CustomerService>();
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
        .then((it) {
          assert(it.length <= 1);
          return it.single;
        })
        .then((it) {
          assert(it.isFilled);
          return it;
        });

    late Uint8List logoBytes;
    if (companyInfo.logoFileName != null) {
      logoBytes = await _fileService
          .findFile(companyInfo.logoFileName!)
          .then((it) => it.readAsBytes());
    } else {
      logoBytes = await _assetService.getDefaultLogo();
    }

    final invoiceLogo = await InvoiceLogo.create(
      imageService: _imageService,
      bytes: logoBytes,
    );

    final invoice = await _invoiceService.findWithId(
      invoiceId,
      currency: defaultCurrency,
    );
    final customer = await _customerService.findWithId(invoice.customerId);

    final companyDocument = stringService.getInvoiceDocumentString(
      companyInfo.document!,
    );

    final invoiceProducts = await _invoiceService
        .findInvoiceProducts(invoice.id)
        .then((it) async {
          final result = <InvoiceProductPrintRequest>[];

          for (final invoiceProduct in it) {
            final product = await _productService.findById(
              invoiceProduct.productId,
              defaultCurrency: defaultCurrency,
            );

            result.add(
              InvoiceProductPrintRequest(
                name: product.name,
                unitPrice: invoiceProduct.unitPrice.toString(),
                quantity: invoiceProduct.quantity.toString(),
                total: invoiceProduct.total.toString(),
              ),
            );
          }

          return result;
        });

    final remainingUnpaidBalance = invoice.remainingUnpaidBalance.isNonZero
        ? invoice.remainingUnpaidBalance.toString()
        : null;

    _logger.d('Printing invoice');
    _printerService.printInvoice(
      PrintInvoiceRequest(
        invoiceLogoBytes: invoiceLogo.bytes,
        companyDocument: companyDocument,
        companyPhone: companyInfo.phone!,
        companyEmail: companyInfo.email!,
        invoiceCustomer: customer.name,
        invoiceCity: customer.city.name,
        invoiceDate: Jiffy.parseFromDateTime(invoice.date).yMd,
        printerInfoRequest: printerInfoRequest,
        totalValue: invoice.total.toString(),
        invoiceProducts: invoiceProducts,
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
