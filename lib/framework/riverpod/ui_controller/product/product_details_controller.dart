import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/ui_state/product/product_details_state.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/riverpod/ui_controller/product/current_product_controller.dart';

final productDetailsControllerProvider =
    NotifierProvider<ProductDetailsController, ProductDetailsState>(
      ProductDetailsController.new,
    );

class ProductDetailsController extends Notifier<ProductDetailsState> {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  @override
  ProductDetailsState build() {
    // NOTE: Notice the null-check assertion operator---We need to make sure
    // we are creating this controller only when we have a product selected
    // with the dependency provider.
    final product = ref.watch(currentProductNotifierProvider)!;

    return ProductDetailsState(product: product);
  }

  Future<void> delete() async {
    _logger.d('Deleting product: ${state.product}');

    state = state.copyWith(isLoading: true);

    //await ref.read(deleteProductUseCaseProvider).exec(state.product.id);

    state = state.copyWith(isLoading: false);
  }
}
