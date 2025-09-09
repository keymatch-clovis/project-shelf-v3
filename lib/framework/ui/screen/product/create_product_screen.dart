import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/framework/bloc/app_preferences_bloc.dart';
import 'package:project_shelf_v3/framework/bloc/create_product_bloc.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/components/product_form.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPreferencesBloc, AppPreferencesState>(
      builder: (_, state) {
        switch (state) {
          case InitialState():
            return const Center(child: CircularProgressIndicator());
          case SuccessState():
            return BlocProvider(
              create: (_) => CreateProductBloc(state.defaultCurrency),
              child: _CreateProductView(),
            );
        }
      },
    );
  }
}

class _CreateProductView extends StatelessWidget {
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
              sliver: _SliverAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
            ),
          ];
        },
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  _CreateProductForm(),
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

  const _SliverAppBar({this.innerBoxIsScrolled = false});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocBuilder<CreateProductBloc, CreateProductState>(
      builder: (context, state) {
        return SliverAppBar(
          title: Text(localizations.add_product),
          // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
          actionsPadding: EdgeInsets.symmetric(horizontal: 4),
          actions: [
            FilledButton(
              onPressed: state.isValid
                  ? () => context.read<CreateProductBloc>().add(Submitted())
                  : null,
              child: Text(localizations.save),
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

class _CreateProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProductBloc, CreateProductState>(
      builder: (context, state) {
        return SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: ProductForm(
            nameInput: state.nameInput,
            onNameChanged: (value) {
              context.read<CreateProductBloc>().add(NameChanged(value));
            },
            defaultPriceInput: state.defaultPriceInput,
            onDefaultPriceChanged: (value) {
              context.read<CreateProductBloc>().add(DefaultPriceChanged(value));
            },
            stockInput: state.stockInput,
            onStockChanged: (value) {
              context.read<CreateProductBloc>().add(StockChanged(value));
            },
          ),
        );
      },
    );
  }
}
