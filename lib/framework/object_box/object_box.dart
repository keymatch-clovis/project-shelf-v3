import "package:logger/logger.dart";
import "package:path/path.dart" as path;
import "package:path_provider/path_provider.dart";
import "package:project_shelf_v3/adapter/dto/object_box/invoice_draft_dto.dart";
import "package:project_shelf_v3/adapter/dto/object_box/invoice_draft_product_dto.dart";
import "package:project_shelf_v3/adapter/repository/invoice_draft_repository.dart";
import "package:project_shelf_v3/common/logger/framework_printer.dart";
import "package:project_shelf_v3/objectbox.g.dart";

class ObjectBox implements InvoiceDraftRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  /// The store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    Logger(printer: FrameworkPrinter()).d("Opening ObjectBox");

    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
      directory: path.join(docsDir.path, "obx-shelf"),
    );
    return ObjectBox._create(store);
  }

  @override
  List<InvoiceDraftDto> getInvoiceDrafts() {
    _logger.d("Getting invoice drafts");

    return store.box<InvoiceDraftDto>().getAll();
  }

  @override
  int createInvoiceDraft(CreateArgs args) {
    _logger.d("Creating invoice draft with: $args");
    final invoiceDraftDto = InvoiceDraftDto(
      date: args.date,
      remainingUnpaidBalance: args.remainingUnpaidBalance,
      customerId: args.customerId,
    );

    for (final product in args.products) {
      final dto = InvoiceDraftProductDto(
        productId: product.productId,
        quantity: product.quantity,
        unitPrice: product.unitPrice,
      );

      dto.invoice.target = invoiceDraftDto;

      store.box<InvoiceDraftProductDto>().put(dto);
    }

    return store.box<InvoiceDraftDto>().put(invoiceDraftDto);
  }
}
