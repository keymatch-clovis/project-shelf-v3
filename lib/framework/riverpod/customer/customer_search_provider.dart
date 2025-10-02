import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/customer/search_customers_use_case.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/main.dart';

/// Provider related
final class CustomerSearchNotifier
    extends StreamNotifier<Iterable<CustomerDto>> {
  final _useCase = getIt.get<SearchCustomersUseCase>();
  final _debouncer = Debouncer();

  String _query = "";

  @override
  Stream<List<CustomerDto>> build() {
    return _useCase.exec(_query).map((it) {
      return it.map(CustomerDto.fromResponse).toList();
    });
  }

  Future<void> updateQuery(String query) async {
    _debouncer.debounce(() {
      _query = query;
      ref.invalidateSelf();
    });
    await _debouncer.completer.future;
  }
}

final customerSearchProvider = StreamNotifierProvider.autoDispose(
  CustomerSearchNotifier.new,
);
