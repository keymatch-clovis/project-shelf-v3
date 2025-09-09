import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/main.dart';

/// State related
sealed class CitySearchState {
  const CitySearchState();
}

final class SearchStateEmpty extends CitySearchState {}

final class SearchStateLoading extends CitySearchState {}

final class SearchStateSuccess extends CitySearchState {
  final List<City> items;

  const SearchStateSuccess(this.items);
}

/// Event related
sealed class CitySearchEvent {
  const CitySearchEvent();
}

final class QueryChanged extends CitySearchEvent {
  final String query;

  const QueryChanged(this.query);
}

/// Bloc related
class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  final SearchCitiesUseCase _useCase = getIt.get<SearchCitiesUseCase>();

  CitySearchBloc() : super(SearchStateEmpty()) {
    on<QueryChanged>(_onQueryChanged);
  }

  void _onQueryChanged(QueryChanged event, Emitter<CitySearchState> emit) {
    emit(SearchStateLoading());

    _useCase.exec(event.query).listen((result) {
      emit(SearchStateSuccess(result));
    });
  }
}
