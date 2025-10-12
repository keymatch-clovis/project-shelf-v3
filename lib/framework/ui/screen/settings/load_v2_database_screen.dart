import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/settings/load_v2_database_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

final class LoadV2DatabaseScreen extends ConsumerWidget {
  const LoadV2DatabaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    ref.listen(loadV2DatabaseProvider.select((it) => it.status), (_, status) {
      switch (status) {
        case LoadV2DatabaseStatus.DONE:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              content: Text(localizations.v2_database_loaded),
            ),
          );
        default:
        // Do nothing :p
      }
    });

    return _Screen(onUpload: ref.watch(loadV2DatabaseProvider.notifier).load);
  }
}

final class _Screen extends StatelessWidget {
  final void Function() onUpload;

  const _Screen({required this.onUpload});

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
              child: _BodyPane(onUpload: onUpload),
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
    final status = ref.watch(loadV2DatabaseProvider.select((it) => it.status));

    return SliverAppBar.medium(
      title: Text(localizations.upload_v2_database),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(2),
        child: status == LoadV2DatabaseStatus.LOADING
            ? const LinearProgressIndicator(minHeight: 2)
            : const SizedBox.shrink(),
      ),
    );
  }
}

final class _BodyPane extends StatelessWidget {
  final void Function() onUpload;

  const _BodyPane({required this.onUpload});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: COMPACT_SPACING_H,
        child: Column(
          children: [
            Text("test"),
            FilledButton(onPressed: onUpload, child: Text("upload")),
          ],
        ),
      ),
    );
  }
}
