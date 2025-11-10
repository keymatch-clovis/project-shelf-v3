import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

/// Tries to follow Material 3 Expressive.
/// https://m3.material.io/components/app-bars/specs#51ac0fae-61c2-4abc-b8f9-1167bf54e875
final class ShelfSearchBar extends StatelessWidget {
  final Widget consumerWidget;
  final String hintText;
  final Widget? leading;
  final Widget? trailing;
  final SearchController searchController;

  final void Function(String) onSearch;

  const ShelfSearchBar({
    super.key,
    required this.consumerWidget,
    required this.hintText,
    required this.searchController,
    required this.onSearch,

    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      spacing: T_2,
      children: [
        if (leading != null) ...[leading!],
        Expanded(
          child: SearchAnchor(
            builder: (_, controller) {
              // NOTE: We are trying to follow the M3 Expressive guidelines, so
              // we have to manually create this, sadly.
              // https://m3.material.io/components/app-bars/specs
              return Material(
                color: theme.colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(SEARCH_APP_BAR_HEIGHT),
                    right: Radius.circular(SEARCH_APP_BAR_HEIGHT),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => controller.openView(),
                  child: SizedBox(
                    // We assume this?
                    height: SEARCH_APP_BAR_HEIGHT - T_2,
                    child: Center(
                      child: Text(
                        hintText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            viewOnClose: () {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => FocusScope.of(context).unfocus(),
              );
            },
            suggestionsBuilder: (_, controller) {
              onSearch(controller.text);

              // As we are using riverpod, we are not really using this builder
              // like it is supposed to. I don't really know if this is the
              // correct way of doing this.
              // https://github.com/rrousselGit/riverpod/discussions/2551#discussioncomment-7056819
              return [];
            },
          ),
        ),
        if (trailing != null) ...[trailing!],
      ],
    );
  }
}
