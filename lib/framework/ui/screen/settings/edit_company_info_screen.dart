import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/edit_company_info_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/image_button.dart';

final class EditCompanyInfoScreen extends StatelessWidget {
  const EditCompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      onSave: () {},
      onAddImage: () {},
      onCompanyNameChanged: (it) {},
      onCompanyDocumentChanged: (it) {},
      onCompanyEmailChanged: (it) {},
      onCompanyPhoneChanged: (it) {},
    );
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onSave;
  final void Function() onAddImage;
  final void Function(String) onCompanyNameChanged;
  final void Function(String) onCompanyDocumentChanged;
  final void Function(String) onCompanyEmailChanged;
  final void Function(String) onCompanyPhoneChanged;

  const _Screen({
    required this.onSave,
    required this.onAddImage,
    required this.onCompanyNameChanged,
    required this.onCompanyDocumentChanged,
    required this.onCompanyEmailChanged,
    required this.onCompanyPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(localizations.edit_company_info),
        actionsPadding: XS_SPACING_ALL,
        actions: [
          FilledButton(onPressed: onSave, child: Text(localizations.save)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: MEDIUM_SPACING_H,
            child: _FormPane(
              onAddImage: onAddImage,
              onCompanyNameChanged: onCompanyNameChanged,
              onCompanyDocumentChanged: onCompanyDocumentChanged,
              onCompanyEmailChanged: onCompanyEmailChanged,
              onCompanyPhoneChanged: onCompanyPhoneChanged,
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
    final state = ref.watch(editCompanyInfoProvider);

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
