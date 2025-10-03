import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/company_info_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/image_button.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class CompanyInfoScreen extends ConsumerWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Screen(
      onEdit: () => context.go(CustomRoute.SETTINGS_COMPANY_INFO_EDIT.route),
      onAddImage: () => ref.read(companyInfoProvider.notifier).addImage(),
    );
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onAddImage;
  final void Function() onEdit;

  const _Screen({required this.onAddImage, required this.onEdit});

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
          child: Padding(
            padding: MEDIUM_SPACING_ALL,
            child: _FormPane(
              onAddImage: onAddImage,
              onCompanyNameChanged: (_) {},
              onCompanyDocumentChanged: (_) {},
              onCompanyEmailChanged: (_) {},
              onCompanyPhoneChanged: (_) {},
            ),
          ),
        ),
      ),
    );
  }
}

final class _FormPane extends ConsumerWidget {
  final void Function() onAddImage;
  final void Function(String) onCompanyNameChanged;
  final void Function(String) onCompanyDocumentChanged;
  final void Function(String) onCompanyEmailChanged;
  final void Function(String) onCompanyPhoneChanged;

  const _FormPane({
    required this.onAddImage,
    required this.onCompanyNameChanged,
    required this.onCompanyDocumentChanged,
    required this.onCompanyEmailChanged,
    required this.onCompanyPhoneChanged,
  });

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
            ImageButton(image: Image.memory(data.logoBytes, fit: BoxFit.cover)),
            SizedBox(height: COMPACT_SPACING.toDouble()),
            CustomTextField(label: localizations.company_name, readOnly: true),
            CustomTextField(label: localizations.company_document),
            CustomTextField(label: localizations.company_email),
            CustomTextField(label: localizations.company_phone),
          ],
        );
      },
    );
  }
}
