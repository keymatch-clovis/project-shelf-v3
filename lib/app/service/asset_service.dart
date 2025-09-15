import 'package:money2/money2.dart';

final class CityData {
  final String name;
  final String department;

  const CityData({required this.name, required this.department});
}

abstract interface class AssetService {
  Future<List<CityData>> getCities();
  Future<List<Currency>> getCurrencies();
}
