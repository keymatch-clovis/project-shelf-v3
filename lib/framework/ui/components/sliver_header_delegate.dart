import 'package:flutter/material.dart';

final class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  const SliverHeaderDelegate({required this.height, required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return SizedBox.expand(
      child: Container(color: theme.colorScheme.surface, child: child),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != height || oldDelegate.minExtent != height;
  }
}
