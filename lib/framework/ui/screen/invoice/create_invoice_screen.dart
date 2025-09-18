import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/create_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/custom_state_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class CreateInvoiceScreen extends ConsumerWidget {
  const CreateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We need to listen to this provider for it to not autodispose when the
    // search anchor is closed.
    //
    // NOTE: I don't know another way of doing this.
    ref.listen(customerSearchProvider, (_, _) {});

    return const _Screen();
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
                children: [_Details(), _Products()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;

  const _AppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return SliverAppBar.medium(
      title: Text(localizations.create_invoice),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.downloading_rounded),
        ),
        FilledButton(onPressed: () {}, child: Text(localizations.save)),
      ],
      bottom: TabBar.secondary(
        controller: _tabController,
        tabs: [
          Tab(
            icon: const Icon(Icons.notes_rounded),
            text: localizations.details,
          ),
          Tab(icon: const Icon(Icons.category), text: localizations.products),
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
  final _customerSearchController = SearchController();

  @override
  void dispose() {
    super.dispose();

    _customerSearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createInvoiceProvider);

    return Padding(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      child: Column(
        spacing: 12,
        children: [
          CustomTextField(label: "test"),
          // CustomObjectField(
          //   label: localizations.date,
          //   onTap: () {
          //     showDatePicker(
          //       context: context,
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime(DateTime.now().year - 1),
          //       lastDate: DateTime.now(),
          //     );
          //   },
          // ),
          SearchAnchor(
            viewPadding: EdgeInsets.zero,
            isFullScreen: true,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            searchController: _customerSearchController,
            textInputAction: TextInputAction.next,
            viewOnSubmitted: (_) {
              ref
                  .read(createInvoiceProvider.notifier)
                  .updateCustomer(
                    ref.read(customerSearchProvider).value!.first.customer,
                  );

              _customerSearchController.closeView(null);
            },
            builder: (_, _) {
              return CustomObjectField<CustomerWithCityDto>(
                label: localizations.customer,
                isRequired: true,
                textValue: state.customerInput.value?.name,
                onTap: () {
                  _customerSearchController.openView();
                },
                onClear: () {
                  ref.read(createInvoiceProvider.notifier).updateCustomer(null);
                },
                errors: state.customerInput.errors.parseErrors(context),
              );
            },
            viewBuilder: (_) => _CustomerSearchView(
              onTap: (dto) {
                ref
                    .read(createInvoiceProvider.notifier)
                    .updateCustomer(dto.customer);

                _customerSearchController.closeView(null);
              },
            ),
            suggestionsBuilder: (_, controller) {
              ref
                  .read(customerSearchProvider.notifier)
                  .updateQuery(controller.text);

              return const [];
            },
          ),
          CustomTextField(label: "test"),
          CustomTextField(label: "test"),
        ],
      ),
    );
  }
}

final class _Products extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text("aoeu");
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
