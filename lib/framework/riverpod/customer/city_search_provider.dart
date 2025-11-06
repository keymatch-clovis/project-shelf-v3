import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

/// Provider related
final class CitySearchNotifier extends StreamNotifier<Iterable<CityDto>> {
  final _useCase = getIt.get<SearchCitiesUseCase>();
  final _controller = BehaviorSubject<String>();

  @override
  Stream<Iterable<CityDto>> build() {
    return _controller.stream
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((query) => _useCase.exec(query: query))
        .map((it) => it.map(CityDto.fromEntity));
  }

  void updateQuery(String query) {
    _controller.add(query);
  }
}

final citySearchProvider = StreamNotifierProvider.autoDispose(
  CitySearchNotifier.new,
);
