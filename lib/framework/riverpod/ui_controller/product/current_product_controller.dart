import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';

final currentProductNotifierProvider =
    NotifierProvider<CurrentProductNotifier, ProductDto?>(
      CurrentProductNotifier.new,
    );

// This provider will be used for when we need to select a product and edit it,
// or do something else with it.
//
// NOTE: This is a great difference from the Android ViewModels, as we are
// creating providers for simple functions.
class CurrentProductNotifier extends Notifier<ProductDto?> {
  @override
  ProductDto? build() => null;

  @override
  set state(ProductDto? value) => super.state = value;
}
