import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/company_info_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/edit_company_info_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/image_button.dart';

final class EditCompanyInfoScreen extends ConsumerWidget {
  const EditCompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      editCompanyInfoProvider.select(
        (it) => it.value?.status == EditCompanyInfoStatus.SUCCESS,
      ),
      (_, it) {
        // Before popping after a successful edit, we need to invalidate the
        // details screen view model.
        ref.invalidate(companyInfoProvider);

        if (it) context.pop();
      },
    );

    return _Screen(
      onSave: ref.read(editCompanyInfoProvider.notifier).save,
      onAddImage: ref.read(editCompanyInfoProvider.notifier).setLogo,
      onCompanyNameChanged: ref.read(editCompanyInfoProvider.notifier).setName,
      onCompanyDocumentChanged: ref
          .read(editCompanyInfoProvider.notifier)
          .setDocument,
      onCompanyEmailChanged: ref
          .read(editCompanyInfoProvider.notifier)
          .setEmail,
      onCompanyPhoneChanged: ref
          .read(editCompanyInfoProvider.notifier)
          .setPhone,
    );
  }
}

final class _Screen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final status = ref.watch(
      editCompanyInfoProvider.select((it) => it.value?.status),
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(localizations.edit_company_info),
        actionsPadding: XS_SPACING_ALL,
        actions: [
          FilledButton(
            onPressed: status == EditCompanyInfoStatus.INITIAL ? onSave : null,
            child: Text(localizations.save),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: status == EditCompanyInfoStatus.LOADING
              ? const LinearProgressIndicator(minHeight: 2)
              : const SizedBox.shrink(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: MEDIUM_SPACING_ALL,
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
            ImageButton(
              onTap: onAddImage,
              image: data.companyLogo.value.when(
                some: (it) => Image.memory(it.bytes, fit: BoxFit.cover),
                none: () => null,
              ),
            ),
            SizedBox(height: S_SPACING),
            ShelfTextField(
              label: localizations.company_name,
              value: data.companyName.value,
              onChanged: onCompanyNameChanged,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.next,
            ),
            ShelfTextField(
              label: localizations.company_document,
              value: data.companyDocument.value,
              onChanged: onCompanyDocumentChanged,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.next,
            ),
            ShelfTextField(
              label: localizations.company_email,
              value: data.companyEmail.value,
              onChanged: onCompanyEmailChanged,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            ShelfTextField(
              label: localizations.company_phone,
              value: data.companyPhone.value,
              onChanged: onCompanyPhoneChanged,
              keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.done,
            ),
          ],
        );
      },
    );
  }
}
