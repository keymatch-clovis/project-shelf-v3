import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/find_city_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/search_customers_use_case.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

/// Provider related
final class CustomerSearchNotifier
    extends StreamNotifier<Iterable<CustomerDto>> {
  final _searchCustomersUseCase = getIt.get<SearchCustomersUseCase>();
  final _findCityUseCase = getIt.get<FindCityUseCase>();
  final _controller = BehaviorSubject<String>();

  @override
  Stream<Iterable<CustomerDto>> build() {
    return _controller.stream
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((query) => _searchCustomersUseCase.exec(query))
        .asyncMap((customers) async {
          final result = <(Customer, City)>{};
          for (final customer in customers) {
            final city = await _findCityUseCase
                .exec(customer.id.unwrap())
                .unwrap();

            result.add((customer, city));
          }

          return result;
        })
        .map((it) {
          return it.map((it) {
            return CustomerDto.fromEntity(it.$1, city: it.$2);
          });
        });
  }

  void updateQuery(String query) => _controller.add(query);
}

final customerSearchProvider = StreamNotifierProvider.autoDispose(
  CustomerSearchNotifier.new,
);
