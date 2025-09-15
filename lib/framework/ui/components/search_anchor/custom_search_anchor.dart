import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/framework/riverpod/common/stream_search_notifier.dart';
import 'package:project_shelf_v3/framework/ui/components/loading_indicator.dart';

final class CustomSearchAnchor<T> extends ConsumerStatefulWidget {
  final SearchController? controller;

  /// Custom fields
  final Widget Function(SearchController) anchorBuilder;
  final Widget Function(T, SearchController) listBuilder;
  final StreamNotifierProvider<StreamSearchNotifier<T>, T> provider;
  final void Function()? onClose;

  const CustomSearchAnchor({
    super.key,

    required this.provider,
    required this.anchorBuilder,
    required this.listBuilder,

    this.controller,
    this.onClose,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomSearchAnchorState<T>();
}

final class _CustomSearchAnchorState<T>
    extends ConsumerState<CustomSearchAnchor<T>> {
  late SearchController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = widget.controller ?? SearchController();

    _searchController.addListener(() {
      ref.read(widget.provider.notifier).updateQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      // If the parent did not provide the SearchController, it means we
      // created the SearchController here. And we have to dispose it.
      _searchController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewPadding: EdgeInsets.zero,
      isFullScreen: true,
      textCapitalization: TextCapitalization.characters,
      searchController: _searchController,
      builder: (_, _) => widget.anchorBuilder(_searchController),
      viewBuilder: (_) => Consumer(
        builder: (_, ref, _) {
          return ref
              .watch(widget.provider)
              .when(
                data: (it) => widget.listBuilder(it, _searchController),
                loading: LoadingIndicator.new,
                error: (err, _) {
                  Logger().f(err);
                  throw AssertionError(err);
                },
              );
        },
      ),
      viewOnClose: widget.onClose,
      suggestionsBuilder: (_, _) => const [],
    );
  }
}
