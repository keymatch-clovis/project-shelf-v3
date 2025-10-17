import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_dto.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_product_dto.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_draft_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/object_box/object_box.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: InvoiceDraftRepository, order: RegisterOrder.REPOSITORY)
final class InvoiceDraftBox implements InvoiceDraftRepository {
  final _logger = Logger(printer: FrameworkPrinter());
  final _objectBox = getIt.get<ObjectBox>();

  @override
  Future<int> create(CreateArgs args) async {
    _logger.d("Creating invoice draft with: $args");
    final invoiceDraftDto = InvoiceDraftDto(
      date: args.date,
      remainingUnpaidBalance: args.remainingUnpaidBalance,
      customerId: args.customerId,
      createdAt: DateTime.now(),
    );

    for (final product in args.products) {
      final dto = InvoiceDraftProductDto(
        productId: product.productId,
        quantity: product.quantity,
        unitPrice: product.unitPrice,
      );

      dto.invoice.target = invoiceDraftDto;

      await _objectBox.store.box<InvoiceDraftProductDto>().putAsync(dto);

      invoiceDraftDto.products.add(dto);
    }

    return await _objectBox.store.box<InvoiceDraftDto>().putAsync(
      invoiceDraftDto,
    );
  }

  @override
  Future<List<InvoiceDraftDto>> get() {
    _logger.d("Getting invoice drafts");
    return _objectBox.store.box<InvoiceDraftDto>().getAllAsync();
  }

  @override
  Future<void> delete(int id) async {
    final draftBox = _objectBox.store.box<InvoiceDraftDto>();
    final draftProductBox = _objectBox.store.box<InvoiceDraftProductDto>();

    final draft = (await draftBox.getAsync(id))!;

    _logger.d("Deleting invoice draft products");
    for (final product in draft.products) {
      await draftProductBox.removeAsync(product.id);
    }

    _logger.d("Deleting invoice draft with ID: $id");
    await draftBox.removeAsync(draft.id);
  }

  @override
  Future<InvoiceDraftDto> findWithId(int id) {
    _logger.d("Finding invoice draft with ID: $id");
    return _objectBox.store
        .box<InvoiceDraftDto>()
        .getAsync(id)
        .then((it) => it!);
  }

  @override
  Future<void> update(UpdateArgs args) async {
    _logger.d("Updating invoice draft with: $args");
    await _objectBox.store.runInTransactionAsync(TxMode.write, (store, args) {
      final draftBox = store.box<InvoiceDraftDto>();
      final draftProductBox = store.box<InvoiceDraftProductDto>();

      final draft = (draftBox.get(args.id))!;

      // Remove the products from the draft invoice, and add the new ones.
      //
      // NOTE: This is not as performant, as we are updating the products each
      // time any of the draft properties change. We can leave it like this for
      // now though, as they are not that many, and maybe the biggest invoice
      // might have 100+ products, and that is not that bad for a single
      // transaction.
      draftProductBox.removeMany(draft.products.map((it) => it.id).toList());

      draft.products.clear();

      final products = args.products.map(
        (it) => InvoiceDraftProductDto(
          productId: it.productId,
          quantity: it.quantity,
          unitPrice: it.unitPrice,
        ),
      );

      draft.products.addAll(products);

      // Update other simple properties
      draft.date = args.date;
      draft.customerId = args.customerId;
      draft.remainingUnpaidBalance = args.remainingUnpaidBalance;

      draftBox.put(draft);
    }, args);
  }
}
