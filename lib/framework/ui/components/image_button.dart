import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

final class ImageButton extends StatelessWidget {
  final Image? image;
  final void Function()? onTap;

  const ImageButton({super.key, this.onTap, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: COMPACT_SPACING_H,
      child: SizedBox.square(
        dimension: 150,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          child: _Image(image, onTap: onTap),
        ),
      ),
    );
  }
}

final class _Image extends StatelessWidget {
  final Image? image;
  final void Function()? onTap;

  const _Image(this.image, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (image == null) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: MEDIUM_SPACING_ALL,
          child: Icon(
            Icons.image_search_rounded,
            color: theme.colorScheme.outline,
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Ink.image(image: image!.image),
    );
  }
}
