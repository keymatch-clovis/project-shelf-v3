import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/bloc/product_details_bloc.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/accept_dialog.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              sliver: _SliverAppBar(
                innerBoxIsScrolled: innerBoxIsScrolled,
                onDelete: () => {},
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
                    child: const Text('test'),
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

class _SliverAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final void Function() onDelete;

  const _SliverAppBar({
    required this.onDelete,
    this.innerBoxIsScrolled = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return SliverAppBar(
          title: Text(
            state.dto.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete_outline_rounded),
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AcceptDialog(title: "test", onAccept: onDelete);
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                context.go('/product/see/edit');
              },
            ),
          ],
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
        );
      },
    );
  }
}
