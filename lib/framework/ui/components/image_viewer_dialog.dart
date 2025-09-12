import 'package:flutter/material.dart';

final class ImageViewerDialog extends StatelessWidget {
  final FileImage image;
  final void Function() onDelete;

  const ImageViewerDialog({
    required this.image,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: image),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
