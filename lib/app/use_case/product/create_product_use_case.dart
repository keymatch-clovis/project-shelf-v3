import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class Args {
  final String name;
  final Money? defaultPrice;
  final Money? purchasePrice;
  final int? stock;

  const Args({
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });
}

class CreateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  CreateProductUseCase();

  Future<Id> exec(Args args) async {
    _logger.d('Creating product');

    final appPreferences = await _appPreferencesService.getAppPreferences();
    final zeroMoney = appPreferences.defaultCurrency.parse("0");

    return await _service.create(
      CreateArgs(
        name: args.name.trim().toUpperCase(),
        defaultPrice: args.defaultPrice ?? zeroMoney,
        purchasePrice: args.purchasePrice ?? zeroMoney,
        stock: args.stock ?? 0,
      ),
    );
  }
}
