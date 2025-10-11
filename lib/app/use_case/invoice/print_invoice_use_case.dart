import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/domain/service/file_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/app/service/string_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_logo.dart';
import 'package:project_shelf_v3/domain/service/image_service.dart';
import 'package:project_shelf_v3/main.dart';

final class PrintInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _printerService = getIt.get<PrinterService>();
  final _companyInfoService = getIt.get<CompanyInfoService>();
  final _fileService = getIt.get<FileService>();
  final _invoiceService = getIt.get<InvoiceService>();
  final _customerService = getIt.get<CustomerService>();
  final _imageService = getIt.get<ImageService>();
  final _stringService = getIt.get<StringService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  /// If the [companyInfoRequest] parameter is set, it means the user wants to
  /// override the company info set by default.
  Future<void> exec({
    required Id invoiceId,
    required PrinterInfoRequest printerInfoRequest,
    required String locale,
  }) async {
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
          print(it);
          print(it.logoFileName);
          print(it.name);

          assert(it.logoFileName != null);
          assert(it.name != null);
          assert(it.document != null);
          assert(it.email != null);
          assert(it.phone != null);

          return it;
        });

    final logoBytes = await _fileService
        .findFile(companyInfo.logoFileName!)
        .then((it) => it.readAsBytes());

    final invoiceLogo = await InvoiceLogo.create(
      imageService: _imageService,
      bytes: logoBytes,
    );

    final invoice = await _invoiceService.findWithId(
      invoiceId,
      currency: defaultCurrency,
    );
    final customer = await _customerService.findWithId(invoice.customerId);

    final companyDocument = await _stringService.getInvoiceDocument(
      locale,
      document: companyInfo.document!,
    );

    _logger.d('Printing invoice');
    _printerService.printInvoice(
      PrintInvoiceRequest(
        invoiceLogoBytes: invoiceLogo.bytes,
        companyDocument: '34.234.243.123',
        companyPhone: 'phone',
        companyEmail: 'email',
        invoiceCustomer: customer.name,
        invoiceCity: 'city',
        invoiceDate: 'date',
        printerInfoRequest: printerInfoRequest,
        totalValue: 'total value',
        invoiceProducts: [
          InvoiceProductPrintRequest(
            name: 'TEST',
            unitPrice: '\$ 1.234',
            quantity: '5',
            total: '\$ 5.678',
          ),
          InvoiceProductPrintRequest(
            name: 'TEST',
            unitPrice: '\$ 1.234',
            quantity: '5',
            total: '\$ 5.678',
          ),
          InvoiceProductPrintRequest(
            name: 'TEST',
            unitPrice: '\$ 1.234',
            quantity: '5',
            total: '\$ 5.678',
          ),
        ],
      ),
    );
  }
}
