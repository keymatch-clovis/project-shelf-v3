import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

final class InvoiceProductTable extends StatelessWidget {
  final List<InvoiceProductDto> items;

  final void Function({
    required int index,
    required InvoiceProductDto invoiceProduct,
  })?
  onSelect;

  const InvoiceProductTable(this.items, {super.key, this.onSelect});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: IntrinsicColumnWidth(),
        4: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("#", style: theme.textTheme.labelSmall),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                localizations.name,
                style: theme.textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("×", style: theme.textTheme.labelSmall),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                localizations.unit_price,
                style: theme.textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                localizations.total,
                style: theme.textTheme.labelSmall,
              ),
            ),
          ],
        ),

        // ...[for (var i = 0; i < 50; i++) i].map((it) {
        //   return TableRow(
        //     children: [
        //       TableRowInkWell(onTap: () {}, child: Text("test")),
        //       TableRowInkWell(onTap: () {}, child: Text("test")),
        //       TableRowInkWell(onTap: () {}, child: Text("test")),
        //       TableRowInkWell(onTap: () {}, child: Text("test")),
        //       TableRowInkWell(onTap: () {}, child: Text("test")),
        //     ],
        //   );
        // }),
        ...items.indexed.map((it) {
          return TableRow(
            decoration: it.$1 < items.length - 1
                ? BoxDecoration(
                    border: BoxBorder.fromLTRB(
                      bottom: BorderSide(
                        color: theme.colorScheme.outlineVariant,
                      ),
                    ),
                  )
                : null,
            children: [
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    (it.$1 + 1).toString(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    it.$2.product.name,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    it.$2.quantity.toString(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    it.$2.unitPrice.toString(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.fromLTRB(
                      left: BorderSide(color: theme.colorScheme.outlineVariant),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    it.$2.total.toString(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
