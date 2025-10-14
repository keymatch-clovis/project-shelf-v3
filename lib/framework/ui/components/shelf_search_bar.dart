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
    return Row(
      spacing: S_SPACING,
      children: [
        if (leading != null) ...[leading!],
        Expanded(
          child: SearchAnchor.bar(
            isFullScreen: true,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            searchController: searchController,
            barHintText: hintText,
            barElevation: const WidgetStatePropertyAll(0),
            onClose: () {
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
            // This is the consumer widget from riverpod that will render the data
            // for us.
            viewBuilder: (_) => consumerWidget,
          ),
        ),
        if (trailing != null) ...[trailing!],
      ],
    );
  }
}
