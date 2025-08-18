import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class AcceptDialog extends StatelessWidget {
  final String title;
  final String? body;
  final void Function() onAccept;
  final void Function()? onCancel;

  const AcceptDialog({
    super.key,
    required this.title,
    this.body,
    required this.onAccept,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);

    // https://m3.material.io/components/dialogs/specs
    return Dialog(
      child: Padding(
        // https://m3.material.io/components/dialogs/specs#9a8c226b-19fa-4d6b-894e-e7d5ca9203e8
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: themeData.textTheme.headlineSmall),
            if (body != null) ...[
              const SizedBox(height: 16),
              Text(body!, style: themeData.textTheme.bodyMedium),
            ],
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 4,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(localizations.close),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onAccept();
                  },
                  child: Text(localizations.accept),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
