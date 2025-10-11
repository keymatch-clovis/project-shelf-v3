import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/company_info_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/image_button.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class CompanyInfoScreen extends ConsumerWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Screen(
      onEdit: () => context.go(CustomRoute.SETTINGS_COMPANY_INFO_EDIT.route),
    );
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onEdit;

  const _Screen({required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(localizations.company_info),
        actionsPadding: XS_SPACING_ALL,
        actions: [
          IconButton(onPressed: onEdit, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: MEDIUM_SPACING_ALL, child: _DetailsPane()),
        ),
      ),
    );
  }
}

final class _DetailsPane extends ConsumerWidget {
  const _DetailsPane();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(companyInfoProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        return Column(
          spacing: COMPACT_SPACING.toDouble(),
          children: [
            ImageButton(
              image: Image.memory(
                data.companyInfo.logoBytes!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: S_SPACING),
            ShelfTextField(
              label: localizations.company_name,
              readOnly: true,
              value: data.companyInfo.name,
              enabled: data.companyInfo.name != null,
            ),
            ShelfTextField(
              label: localizations.company_document,
              readOnly: true,
              value: data.companyInfo.document,
              enabled: data.companyInfo.document != null,
            ),
            ShelfTextField(
              label: localizations.company_email,
              readOnly: true,
              value: data.companyInfo.email,
              enabled: data.companyInfo.email != null,
            ),
            ShelfTextField(
              label: localizations.company_phone,
              readOnly: true,
              value: data.companyInfo.phone,
              enabled: data.companyInfo.phone != null,
            ),
          ],
        );
      },
    );
  }
}
