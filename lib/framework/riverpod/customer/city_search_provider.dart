import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/framework/riverpod/common/stream_search_notifier.dart';
import 'package:project_shelf_v3/main.dart';

/// Provider related
final class CitySearchNotifier extends StreamSearchNotifier<List<CityDto>> {
  final _useCase = getIt.get<SearchCitiesUseCase>();
  final _debouncer = Debouncer();

  String _query = "";

  @override
  Stream<List<CityDto>> build() {
    return _useCase.exec(_query).map((it) {
      return it.map(CityDto.fromEntity).toList();
    });
  }

  @override
  Future<void> updateQuery(String query) async {
    _debouncer.debounce(() {
      _query = query;
      ref.invalidateSelf();
    });

    await _debouncer.completer.future;
  }
}

final citySearchProvider = StreamNotifierProvider.autoDispose(
  CitySearchNotifier.new,
);
