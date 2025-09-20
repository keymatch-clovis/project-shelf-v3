import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_dto.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_product_dto.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_draft_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/object_box/object_box.dart';
import 'package:project_shelf_v3/main.dart';
import 'package:project_shelf_v3/objectbox.g.dart';

final class InvoiceDraftBox implements InvoiceDraftRepository {
  final _logger = Logger(printer: FrameworkPrinter());
  final _objectBox = getIt.get<ObjectBox>();

  @override
  int create(CreateArgs args) {
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

      _objectBox.store.box<InvoiceDraftProductDto>().put(dto);
    }

    return _objectBox.store.box<InvoiceDraftDto>().put(invoiceDraftDto);
  }

  @override
  Future<List<InvoiceDraftDto>> get() {
    _logger.d("Getting invoice drafts");
    return _objectBox.store.box<InvoiceDraftDto>().getAllAsync();
  }

  @override
  Future<void> delete(int id) async {
    final draft = (await _objectBox.store.box<InvoiceDraftDto>().getAsync(id))!;

    await _objectBox.store.runInTransactionAsync(TxMode.write, (store, draft) {
      final draftBox = _objectBox.store.box<InvoiceDraftDto>();
      final draftProductBox = _objectBox.store.box<InvoiceDraftProductDto>();

      _logger.d("Deleting invoice draft products");
      for (final product in draft.products) {
        draftProductBox.remove(product.id);
      }

      _logger.d("Deleting invoice draft with ID: $id");
      draftBox.remove(draft.id);
    }, draft);
  }
}
