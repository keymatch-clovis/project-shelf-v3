import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/find_city_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/get_customers_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final customerListProvider = StreamProvider<Iterable<CustomerDto>>((ref) {
  final useCase = getIt.get<GetCustomersUseCase>();

  return useCase.exec().asyncMap((customers) async {
    final result = <CustomerDto>[];

    for (final customer in customers) {
      final city = await getIt
          .get<FindCityUseCase>()
          .exec(customer.cityId)
          .unwrap();

      result.add(CustomerDto.fromEntity(customer, city: city));
    }

    return result;
  });
});
