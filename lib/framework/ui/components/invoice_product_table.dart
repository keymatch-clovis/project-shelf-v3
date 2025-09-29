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
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.labelSmall!;
    final bodyStyle = theme.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.normal,
    );

    final titlePadding = const EdgeInsets.symmetric(horizontal: 6);
    final bodyPadding = const EdgeInsets.symmetric(horizontal: 6, vertical: 12);

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
              padding: titlePadding,
              child: _renderTitleCell("#", style: titleStyle),
            ),
            Padding(
              padding: titlePadding,
              child: _renderTitleCell(localizations.name, style: titleStyle),
            ),
            Padding(
              padding: titlePadding,
              child: _renderTitleCell("×", style: titleStyle),
            ),
            Padding(
              padding: titlePadding,
              child: _renderTitleCell(
                localizations.unit_price,
                style: titleStyle,
              ),
            ),
            Padding(
              padding: titlePadding,
              child: _renderTitleCell(localizations.total, style: titleStyle),
            ),
          ],
        ),
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
                  padding: bodyPadding,
                  child: Text(
                    "${it.$1 + 1}.",
                    textAlign: TextAlign.center,
                    style: bodyStyle,
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: bodyPadding,
                  child: Text(it.$2.product.name, style: bodyStyle),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: bodyPadding,
                  child: Text(
                    it.$2.quantity.toString(),
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableRowInkWell(
                onTap: () =>
                    onSelect?.call(index: it.$1, invoiceProduct: it.$2),
                child: Container(
                  padding: bodyPadding,
                  child: Text(it.$2.unitPrice.toString(), style: bodyStyle),
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
                  padding: bodyPadding,
                  child: Text(it.$2.total.toString(), style: bodyStyle),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

Widget _renderTitleCell(String title, {required TextStyle style}) {
  return Text(title, style: style, textAlign: TextAlign.center);
}
