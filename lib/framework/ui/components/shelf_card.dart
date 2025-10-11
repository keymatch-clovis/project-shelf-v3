import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

final class ShelfCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const ShelfCard({
    super.key,
    required this.child,
    this.padding = S_SPACING_ALL,
  });

  @override
  Widget build(BuildContext context) {
    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: Padding(padding: padding, child: child),
    );
  }
}
