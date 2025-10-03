import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

final class EditCompanyInfoScreen extends StatelessWidget {
  const EditCompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Screen(onSave: () {});
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onSave;

  const _Screen({required this.onSave});

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
    );
  }
}
