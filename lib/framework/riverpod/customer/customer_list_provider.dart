import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/use_case/customer/watch_customers_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final customerListProvider = StreamProvider<List<Customer>>((ref) {
  final useCase = getIt.get<WatchCustomersUseCase>();

  return useCase.exec();
});
