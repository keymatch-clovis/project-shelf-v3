import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class InvoiceDetailsScreen extends ConsumerWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Screen(onPrint: () {});
  }
}

final class _Screen extends ConsumerStatefulWidget {
  final void Function() onPrint;

  const _Screen({required this.onPrint});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenState();
}

final class _ScreenState extends ConsumerState<_Screen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
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
            // NOTE: I don't really know why this [SizedBox] here works. If we
            // remove it, the widget fails to build.
            child: SizedBox.shrink(
              child: TabBarView(
                controller: _tabController,
                children: [_DetailsPane(), Text("tester")],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onPrint,
        child: const Icon(Icons.print_rounded),
      ),
    );
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;

  const _AppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedState = ref.watch(
      selectedInvoiceProvider.select((it) => it as Selected),
    );

    final localizations = AppLocalizations.of(context)!;
    return SliverAppBar(
      title: Text(localizations.invoice(selectedState.invoice.number)),
      bottom: TabBar.secondary(
        controller: _tabController,
        tabs: [
          const Tab(icon: Icon(Icons.notes_outlined)),
          const Tab(icon: Icon(Icons.category_outlined)),
        ],
      ),
    );
  }
}

final class _DetailsPane extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final selectedState = ref.watch(
      selectedInvoiceProvider.select((it) => it as Selected),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: COMPACT_SPACING_ALL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              readOnly: true,
              label: localizations.number,
              value: selectedState.invoice.number.toString(),
            ),
            CustomTextField(
              readOnly: true,
              label: localizations.date,
            ),
            CustomObjectField(label: localizations.customer),
          ],
        ),
      ),
    );
  }
}
