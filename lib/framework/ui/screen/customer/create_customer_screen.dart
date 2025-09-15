import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/create_customer_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/form/create_customer_details_form.dart';

final class CreateCustomerScreen extends ConsumerWidget {
  const CreateCustomerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    ref.listen(createCustomerProvider.select((it) => it.status), (_, state) {
      switch (state) {
        case CreateCustomerStatus.SUCCESS:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              content: Text(localizations.customer_created),
            ),
          );
          context.pop();
        default:
        // Do nothing :p
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.create_customer),
        actions: [_CreateAction()],
      ),
      body: _CustomerDetails(),
    );
  }
}

final class _CreateAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createCustomerProvider);

    return FilledButton(
      onPressed: state.isValid
          ? ref.read(createCustomerProvider.notifier).create
          : null,
      child: Text(localizations.save),
    );
  }
}

final class _CustomerDetails extends StatelessWidget {
  const _CustomerDetails();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: CreateCustomerDetailsForm());
  }
}
