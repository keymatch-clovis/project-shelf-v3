import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_search_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/customer_list_tile.dart';
import 'package:project_shelf_v3/framework/ui/components/empty_placeholder.dart';

final class CustomerSearchList extends ConsumerWidget {
  final Function(CustomerDto) onSelect;

  const CustomerSearchList({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final stream = ref.watch(customerSearchProvider);

    return stream.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        if (data.isEmpty) {
          return EmptyPlaceholder(
            title: localizations.no_customers_found,
            icon: Icons.group_rounded,
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return CustomerListTile(data.toList()[index], onSelect: onSelect);
          },
        );
      },
    );
  }
}
