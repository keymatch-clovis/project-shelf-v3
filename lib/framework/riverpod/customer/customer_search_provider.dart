import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/customer/search_customers_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

/// Provider related
final class CustomerSearchNotifier
    extends StreamNotifier<Iterable<CustomerDto>> {
  final _searchCustomersUseCase = getIt.get<SearchCustomersUseCase>();
  final _controller = BehaviorSubject<String>();

  @override
  Stream<Iterable<CustomerDto>> build() {
    return _controller.stream
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((query) => _searchCustomersUseCase.exec(query))
        .map((it) => it.map(CustomerDto.fromResponse));
  }

  void updateQuery(String query) => _controller.add(query);
}

final customerSearchProvider = StreamNotifierProvider.autoDispose(
  CustomerSearchNotifier.new,
);
