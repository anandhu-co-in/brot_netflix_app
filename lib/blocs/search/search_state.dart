part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResult> searchResultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
        searchResultList: [], idleList: [], isLoading: false, isError: false);
  }
}
