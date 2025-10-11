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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: _BodyPane(),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: Text(localizations.settings)),
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: COMPACT_SPACING_ALL,
    //         child: Column(
    //           spacing: COMPACT_SPACING.toDouble(),
    //           children: [
    //             Card(
    //               clipBehavior: Clip.antiAlias,
    //               child: ListTile(
    //                 onTap: onCompanyInfoNavigated,
    //                 leading: const Icon(Icons.business_rounded),
    //                 title: Text(localizations.company_info),
    //                 trailing: const Icon(Icons.chevron_right_rounded),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        spacing: XS_SPACING,
        children: [
          // Trying to follow:
          // https://m3.material.io/blog/building-with-m3-expressive
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.business_rounded),
            title: Text(localizations.company_info),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
