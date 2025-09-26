import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_product_form_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/create_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/create_invoice_product_dialog.dart';
import 'package:project_shelf_v3/framework/ui/components/product_search_anchor.dart';
import 'package:project_shelf_v3/common/date_time_extensions.dart';

final class CreateInvoiceScreen extends ConsumerWidget {
  const CreateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We need to listen to this provider for it to not autodispose when the
    // search anchor is closed.
    //
    // NOTE: I don't know another way of doing this.
    // ref.listen(customerSearchProvider, (_, _) {});

    // When the invoice product creation provider changes, it means the user
    // has selected a product to add to the invoice. We need to open a dialog
    // to set the product properties.
    ref.listen(
      invoiceProductFormProvider.select((it) => it.value!.productInput.value),
      (_, product) {
        if (product != null) {
          showDialog<InvoiceProductDto>(
            context: context,
            builder: (_) => CreateInvoiceProductDialog(),
          ).then((it) {
            if (it != null) {
              ref.read(createInvoiceProvider.notifier).addInvoiceProduct(it);
            }
          });
        }
      },
    );

    // NOTE: We have to be careful here. This screen is using both the
    // `createInvoiceProvider` and the `createInvoiceDraftProvider`. The
    // `createInvoiceDraftProvider` is also used by the `createInvoiceProvider`
    // which creates a double dependency. As such, we need to only listen to
    // the `createInvoiceProvider`, and everything should be loaded correctly.
    return ref
        .watch(createInvoiceProvider)
        .when(
          data: (_) => _Screen(),
          loading: () => _LoadingScreen(),
          error: (err, _) {
            Logger().f(err);
            throw AssertionError(err);
          },
        );
  }
}

final class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceDim,
      body: Dialog(
        shadowColor: theme.colorScheme.shadow,
        child: Container(
          // https://m3.material.io/components/dialogs/specs#9a8c226b-19fa-4d6b-894e-e7d5ca9203e8
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Setting up", style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _Screen extends StatefulWidget {
  const _Screen();

  @override
  State<StatefulWidget> createState() => _ScreenState();
}

final class _ScreenState extends State<_Screen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(_tabController),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: SizedBox.shrink(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(child: _Details()),
                  _Products(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: AnimatedBuilder(
        animation: _tabController.animation!,
        builder: (context, _) {
          final tab = _tabController.animation!.value.round();
          return _FloatingActionButton(tab);
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _tabController.animation!,
        builder: (context, _) {
          final tab = _tabController.animation!.value.round();
          return _Actions(tab);
        },
      ),
    );
  }
}

final class _FloatingActionButton extends ConsumerWidget {
  final int currentTab;

  const _FloatingActionButton(this.currentTab);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (currentTab) {
      1 => ProductSearchAnchor(
        onSelect: (product) async {
          final currentStock = await ref
              .read(createInvoiceProvider.notifier)
              .getCurrentProductQuantity(product.id)
              .then((it) => product.stock - it);

          ref
              .read(invoiceProductFormProvider.notifier)
              .setProduct(product: product, currentStock: currentStock);
        },
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

final class _Actions extends ConsumerWidget {
  final int currentTab;

  const _Actions(this.currentTab);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProductsEmpty = ref.watch(
      createInvoiceProvider.select((it) => it.value!.invoiceProducts.isEmpty),
    );

    var children = <Widget>[];
    switch (currentTab) {
      case 1:
        children = [
          IconButton(
            onPressed: isProductsEmpty
                ? null
                : ref.read(createInvoiceProvider.notifier).clearProducts,
            icon: const Icon(Icons.delete_sweep_rounded),
          ),
        ];
    }

    return BottomAppBar(child: Row(children: children));
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;

  const _AppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    // This provider MUST be loaded if we reach this point.
    final draftStatus = ref.watch(
      createInvoiceProvider.select((it) => it.value!.status),
    );

    return SliverAppBar(
      title: Text(localizations.create_invoice),
      actions: [
        IconButton(
          onPressed: () {},
          icon: draftStatus == CreateInvoiceStatus.SAVING_DRAFT
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                  constraints: BoxConstraints.tight(const Size.square(14)),
                )
              : const Icon(Icons.download_done_outlined),
        ),
        FilledButton(onPressed: () {}, child: Text(localizations.save)),
      ],
      bottom: TabBar.secondary(
        controller: _tabController,
        tabs: [
          Tab(icon: const Icon(Icons.notes_rounded)),
          Tab(icon: const Icon(Icons.category)),
        ],
      ),
    );
  }
}

final class _Details extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsState();
}

final class _DetailsState extends ConsumerState<_Details> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createInvoiceProvider).value!;

    return Padding(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      child: Column(
        spacing: 12,
        children: [
          CustomObjectField<DateTime>(
            isRequired: true,
            label: localizations.date,
            value: state.dateInput.value,
            errors: state.dateInput.errors.parseErrors(context),
            emptyLabel: localizations.no_date_selected,
            body: state.dateInput.value != null
                ? Text(state.dateInput.value!.toJiffy()!.yMd)
                : null,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime(DateTime.now().year + 1),
              ).then((it) {
                if (it != null) {
                  ref.read(createInvoiceProvider.notifier).updateDate(it);
                }
              });
            },
            onClear: () {
              ref.read(createInvoiceProvider.notifier).clearDate();
            },
          ),
          _CustomerSearchAnchor(),
        ],
      ),
    );
  }
}

final class _Products extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final products = ref.watch(
      createInvoiceProvider.select((it) => it.value!.invoiceProducts),
    );
    final totalValue = ref.watch(
      createInvoiceProvider.select((it) => it.value!.totalValue),
    );

    if (products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: theme.colorScheme.outline),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category_rounded,
                  size: 96,
                  color: theme.colorScheme.outlineVariant,
                ),
                Text(
                  localizations.no_invoice_products,
                  style: TextStyle(color: theme.colorScheme.outline),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: theme.colorScheme.outline),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Table(
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
                          bottom: BorderSide(
                            color: theme.colorScheme.outlineVariant,
                          ),
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
                    ...products.indexed.map((it) {
                      return TableRow(
                        decoration: it.$1 < products.length - 1
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: BoxBorder.fromLTRB(
                                  left: BorderSide(
                                    color: theme.colorScheme.outlineVariant,
                                  ),
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
                ),
              ),
            ),
            Divider(height: 0),
            Row(children: [Text("TOTAL"), Text(totalValue.toString())]),
          ],
        ),
      ),
    );
  }
}

final class _ProductListTile extends ConsumerWidget {
  final InvoiceProductDto item;

  const _ProductListTile(this.item);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final leadingTextStyle = const TextStyle();

    return ListTile(
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${item.unitPrice} × ${item.quantity}",
            style: leadingTextStyle
                .merge(theme.textTheme.labelSmall)
                .copyWith(color: theme.colorScheme.outline, height: 0),
          ),
          Text(
            item.total.toString(),
            style: leadingTextStyle
                .merge(theme.textTheme.labelLarge)
                .copyWith(height: 0),
          ),
        ],
      ),
      title: Text(
        item.product.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert_rounded),
      ),
    );
  }
}

final class _CustomerSearchAnchor extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomerSearchAnchorState();
}

final class _CustomerSearchAnchorState
    extends ConsumerState<_CustomerSearchAnchor> {
  final searchController = SearchController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final customerInput = ref.watch(
      createInvoiceProvider.select((it) => it.value!.customerInput),
    );

    return SearchAnchor(
      viewPadding: EdgeInsets.zero,
      isFullScreen: true,
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.text,
      searchController: searchController,
      textInputAction: TextInputAction.next,
      viewOnSubmitted: (_) {
        ref
            .read(createInvoiceProvider.notifier)
            .updateCustomer(
              ref.read(customerSearchProvider).value!.first.customer,
            );

        searchController.closeView(null);
      },
      builder: (_, _) {
        return CustomObjectField<CustomerDto>(
          label: localizations.customer,
          isRequired: true,
          value: customerInput.value,
          body: customerInput.value != null
              ? Text(customerInput.value!.name)
              : Text(
                  "No customer selected",
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
          onTap: () {
            searchController.openView();
          },
          onClear: () {
            ref.read(createInvoiceProvider.notifier).updateCustomer(null);
          },
          errors: customerInput.errors.parseErrors(context),
        );
      },
      viewBuilder: (_) => _CustomerSearchView(
        onTap: (dto) {
          ref.read(createInvoiceProvider.notifier).updateCustomer(dto.customer);

          searchController.closeView(null);
        },
      ),
      suggestionsBuilder: (_, controller) {
        ref.read(customerSearchProvider.notifier).updateQuery(controller.text);

        return const [];
      },
    );
  }
}

final class _CustomerSearchView extends ConsumerWidget {
  final void Function(CustomerWithCityDto)? onTap;

  const _CustomerSearchView({this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerSearchProvider);

    return state.when(
      data: (it) => _CustomerSearchList(it, onTap: onTap),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _CustomerSearchList extends StatelessWidget {
  final List<CustomerWithCityDto> items;
  final void Function(CustomerWithCityDto)? onTap;

  const _CustomerSearchList(this.items, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.groups_rounded,
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              localizations.no_customers_found,
              style: TextStyle(color: theme.colorScheme.outline),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return _CustomerSearchTile(items[index], onTap: onTap);
      },
    );
  }
}

final class _CustomerSearchTile extends StatelessWidget {
  final CustomerWithCityDto dto;
  final void Function(CustomerWithCityDto)? onTap;

  const _CustomerSearchTile(this.dto, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(dto),
      title: Text(dto.customer.name),
      subtitle: Text(dto.city.name),
    );
  }
}
