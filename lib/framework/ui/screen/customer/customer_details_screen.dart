import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/selected_customer_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class CustomerDetailsScreen extends ConsumerWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    ref.listen(selectedCustomerProvider.select((it) => it.status), (_, state) {
      switch (state) {
        case SelectedCustomerStatus.DELETED:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              content: Text(localizations.customer_deleted),
            ),
          );
        default:
        // Do nothing :p
      }
    });

    return _Screen();
  }
}

final class _Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: _CustomerDetails(),
            ),
          ],
        ),
      ),
    );
  }
}

final class _AppBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(selectedCustomerProvider);

    return switch (state) {
      None() => throw AssertionError(),
      Selected() => SliverAppBar.medium(
        title: Text(
          state.customer.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    };
  }
}

final class _CustomerDetails extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(selectedCustomerProvider);

    return switch (state) {
      None() => throw AssertionError(),
      Selected() => SingleChildScrollView(
        child: Padding(
          // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            spacing: 12,
            children: [
              CustomTextField(
                isRequired: true,
                readOnly: true,
                value: state.customer.name,
                label: localizations.name,
              ),
              CustomTextField(
                isRequired: true,
                readOnly: true,
                value:
                    "${state.customer.city.name}, ${state.customer.city.department}",
                label: localizations.city,
              ),
              CustomTextField(
                readOnly: true,
                value: state.customer.businessName,
                label: localizations.business_name,
              ),
              CustomTextField(
                readOnly: true,
                value: state.customer.address,
                label: localizations.address,
              ),
              CustomTextField(
                readOnly: true,
                value: state.customer.phoneNumber,
                label: localizations.phone_number,
              ),
            ],
          ),
        ),
      ),
    };
  }
}
