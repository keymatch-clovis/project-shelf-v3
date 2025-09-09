import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/components/product_form.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    /// Controller related

    // /// Event related
    // ref.listen<ViewModelEvent?>(editProductViewModelEventProvider, (_, event) {
    //   if (event is ProductEdited) {
    //     ScaffoldMessenger.of(
    //       context,
    //     ).showSnackBar(SnackBar(content: Text(localizations.product_edited)));
    //
    //     context.pop();
    //   }
    //
    //   // Always clear the event after it has been read.
    //   ref.read(editProductViewModelEventProvider.notifier).state = null;
    // });

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text(
                  localizations.edit_product,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                floating: true,
                pinned: true,
                snap: true,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                forceElevated: innerBoxIsScrolled,
                actions: [
                  // FilledButton(
                  //   onPressed: state.isValid ? controller.edit : null,
                  //   child: state.isLoading
                  //       ? CircularProgressIndicator(
                  //           constraints: BoxConstraints.tight(Size.square(20)),
                  //         )
                  //       : Text(AppLocalizations.of(context)!.save),
                  // ),
                ],
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Text("test"),
                    // child: ProductForm(
                    //   nameInput: state.name,
                    //   onNameChanged: controller.updateName,
                    //   defaultPriceInput: state.defaultPrice,
                    //   onDefaultPriceChanged: controller.updateDefaultPrice,
                    //   stockInput: state.stock,
                    //   onStockChanged: controller.updateStock,
                    // ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
