import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/ui/components/image_viewer_dialog.dart';

final class ProductImagesForm extends StatelessWidget {
  final List<File> photoFiles;

  const ProductImagesForm(this.photoFiles, {super.key});

  @override
  Widget build(BuildContext context) {
    if (photoFiles.isEmpty) {
      return const Center(child: Text("empty"));
    }

    return GridView.count(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      mainAxisSpacing: 16,
      crossAxisSpacing: 12,
      crossAxisCount: 2,
      children: [
        ...photoFiles
            .map((it) {
              return FileImage(it, scale: 0.8);
            })
            .map((it) => _ImageContainer(it)),
      ],
    );
  }
}

final class _ImageContainer extends StatelessWidget {
  final FileImage image;

  const _ImageContainer(this.image);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return ImageViewerDialog(image: image, onDelete: () {});
            },
          );
        },
        child: Ink.image(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
