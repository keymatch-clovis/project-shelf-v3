import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

/// State related
enum SearchStatus { initial, loading }

@freezed
abstract class SearchState<T> with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default("") String query,
    @Default([]) List<T> result,
  }) = _SearchState;
}
