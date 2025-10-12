import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      onNavigateCompanyInfo: () =>
          context.go(CustomRoute.SETTINGS_COMPANY_INFO.route),
      onUploadV2Database: () =>
          context.go(CustomRoute.SETTINGS_UPLOAD_V2_DATABASE.route),
    );
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onNavigateCompanyInfo;
  final void Function() onUploadV2Database;

  const _Screen({
    required this.onNavigateCompanyInfo,
    required this.onUploadV2Database,
  });

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
              child: _BodyPane(
                onNavigateCompanyInfo: onNavigateCompanyInfo,
                onUploadV2Database: onUploadV2Database,
              ),
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

    return SliverAppBar.large(title: Text(localizations.settings));
  }
}

final class _BodyPane extends StatelessWidget {
  final void Function() onNavigateCompanyInfo;
  final void Function() onUploadV2Database;

  const _BodyPane({
    required this.onNavigateCompanyInfo,
    required this.onUploadV2Database,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        spacing: XS_SPACING,
        children: [
          ListTile(
            onTap: onNavigateCompanyInfo,
            leading: const Icon(Icons.business_outlined),
            title: Text(localizations.company_info),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: onUploadV2Database,
            leading: const Icon(Icons.upload_file_outlined),
            title: Text(localizations.upload_v2_database),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
