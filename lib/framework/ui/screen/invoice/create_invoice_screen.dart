import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/common/date_time_extensions.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/create_invoice_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_product_form_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/invoice_product_form_dialog.dart';
import 'package:project_shelf_v3/framework/ui/components/product_search_anchor.dart';

final class CreateInvoiceScreen extends ConsumerWidget {
  const CreateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(createInvoiceProvider)
        .when(
          data: (_) => _Screen(
            onInvoiceProductSelected: (invoiceProduct) {
              var availableStock = ref
                  .read(createInvoiceProvider.notifier)
                  .getProductAvailableStock(invoiceProduct.product);
              // This is different, as we are editing. We need the
              // [availableStock] + the amount we are editing.
              availableStock += invoiceProduct.quantity;

              showDialog<InvoiceProductDto>(
                context: context,
                builder: (_) => InvoiceProductFormDialog(
                  InvoiceProductFormArgs(
                    // NOTE: This here seems a bit weird, and it is. Maybe in
                    // the future we'll find a better way of doing this.
                    invoiceProduct: invoiceProduct,
                    product: invoiceProduct.product,
                    availableStock: availableStock,
                  ),
                ),
              ).then((it) async {
                if (it != null) {
                  ref
                      .read(createInvoiceProvider.notifier)
                      .addInvoiceProduct(it);
                }
              });
            },
            onProductSelected: (product) {
              final availableStock = ref
                  .read(createInvoiceProvider.notifier)
                  .getProductAvailableStock(product);

              showDialog<InvoiceProductDto>(
                context: context,
                builder: (_) => InvoiceProductFormDialog(
                  InvoiceProductFormArgs(
                    product: product,
                    availableStock: availableStock,
                  ),
                ),
              ).then((it) async {
                if (it != null) {
                  ref
                      .read(createInvoiceProvider.notifier)
                      .addInvoiceProduct(it);
                }
              });
            },
            onRemainingUnpaidBalanceChanged: ref
                .read(createInvoiceProvider.notifier)
                .updateRemainingUnpaidBalance,
            onCreated: ref.read(createInvoiceProvider.notifier).create,
          ),
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
  final void Function(InvoiceProductDto) onInvoiceProductSelected;
  final void Function(ProductDto) onProductSelected;
  final void Function(String) onRemainingUnpaidBalanceChanged;
  final void Function() onCreated;

  const _Screen({
    required this.onInvoiceProductSelected,
    required this.onProductSelected,
    required this.onRemainingUnpaidBalanceChanged,
    required this.onCreated,
  });

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
          _AppBar(_tabController, onCreated: widget.onCreated),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: SizedBox.shrink(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: _Details(
                      onRemainingUnpaidBalanceChanged:
                          widget.onRemainingUnpaidBalanceChanged,
                    ),
                  ),
                  _Products(onSelected: widget.onInvoiceProductSelected),
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
          return _FloatingActionButton(
            tab,
            onProductSelected: widget.onProductSelected,
          );
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

final class _FloatingActionButton extends StatelessWidget {
  final int currentTab;
  final void Function(ProductDto) onProductSelected;

  const _FloatingActionButton(
    this.currentTab, {
    required this.onProductSelected,
  });

  @override
  Widget build(BuildContext context) {
    return switch (currentTab) {
      1 => ProductSearchAnchor(onSelect: onProductSelected),
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
            icon: const Icon(Icons.delete_sweep_outlined),
          ),
        ];
    }

    return BottomAppBar(child: Row(children: children));
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;
  final void Function() onCreated;

  const _AppBar(this._tabController, {required this.onCreated});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    // This provider MUST be loaded if we reach this point.
    final draftStatus = ref.watch(
      createInvoiceProvider.select((it) => it.value!.status),
    );
    final isValid = ref.watch(
      createInvoiceProvider.select((it) => it.value!.isValid),
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
        FilledButton(
          onPressed: isValid ? onCreated : null,
          child: Text(localizations.save),
        ),
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
  final void Function(String) onRemainingUnpaidBalanceChanged;

  const _Details({required this.onRemainingUnpaidBalanceChanged});

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
          CustomTextField(
            value: state.remainingUnpaidBalanceInput.value,
            label: localizations.remaining_unpaid_balance,
            keyboardType: TextInputType.number,
            errors: state.remainingUnpaidBalanceInput.errors.parseErrors(
              context,
            ),
            onChanged: widget.onRemainingUnpaidBalanceChanged,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(currency: state.currency),
            ],
          ),
        ],
      ),
    );
  }
}

final class _Products extends ConsumerWidget {
  final void Function(InvoiceProductDto) onSelected;

  const _Products({required this.onSelected});

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
      return Center(
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
      );
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...products.values.map<Widget>((it) {
                  return ListTile(
                    onTap: () => onSelected(it),
                    title: Text(it.product.name),
                    subtitle: Text(it.unitPrice.toString()),
                    leading: Text("${it.quantity} ×"),
                    trailing: Text(it.total.toString()),
                  );
                }),
              ],
            ),
          ),
        ),
        // https://m3.material.io/foundations/layout/applying-layout/compact#5a83ddd7-137f-4657-ba2d-eb08cac065e7
        const Divider(height: 0, indent: 16, endIndent: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("TOTAL: $totalValue")],
          ),
        ),
      ],
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
          emptyLabel: localizations.no_cities_found,
          isRequired: true,
          value: customerInput.value,
          body: customerInput.value != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customerInput.value!.name),
                      Text(customerInput.value!.cityId.toString()),
                    ],
                  ),
                )
              : null,
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
