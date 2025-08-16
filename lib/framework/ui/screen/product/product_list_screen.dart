import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.products),
        // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
        actionsPadding: EdgeInsets.symmetric(horizontal: 4),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.large(
        child: Icon(Icons.add),
        onPressed: () => context.go("/product/create"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(children: [

            ],
          ),
        ),
      ),
    );
  }
}
