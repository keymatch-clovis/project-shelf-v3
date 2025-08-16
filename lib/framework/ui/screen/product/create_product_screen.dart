import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/adapter/view_model/create_product_view_model.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';

class CreateProductScreen extends ConsumerWidget {
  const CreateProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(createProductViewModelProvider.notifier);
    final state = ref.watch(createProductViewModelProvider);

    /// Events related
    ref.listen<ViewModelEvent?>(createProductViewModelEventProvider, (
      _,
      event,
    ) {
      if (event is ProductCreated) {
        context.go("/product");
      }

      // Always clear the event after it has been read.
      ref.read(createProductViewModelEventProvider.notifier).state = null;
    });

    // FIXME: This should be different.
    final currencyFormatter = NumberFormat.currency(
      name: 'COP',
      symbol: '',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.add_customer),
        // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: [
          FilledButton(
            onPressed: viewModel.create,
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
      body: Padding(
        // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(AppLocalizations.of(context)!.name),
              ),
              keyboardType: TextInputType.name,
              onChanged: viewModel.updateName,
            ),
            Text(state.name.errors.toString()),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(AppLocalizations.of(context)!.name),
              ),
              keyboardType: TextInputType.number,
              onChanged: viewModel.updateDefaultPrice,
              inputFormatters: [
                CurrencyInputFormatter(formatter: currencyFormatter),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
