import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      onCompanyInfoNavigated: () {
        context.go(CustomRoute.SETTINGS_COMPANY_INFO.route);
      },
    );
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onCompanyInfoNavigated;

  const _Screen({required this.onCompanyInfoNavigated});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: COMPACT_SPACING_ALL,
            child: Column(
              spacing: COMPACT_SPACING.toDouble(),
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    onTap: onCompanyInfoNavigated,
                    leading: const Icon(Icons.business_rounded),
                    title: Text(localizations.company_info),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
