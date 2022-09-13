import 'package:bloc/bloc.dart';
import 'package:brot_netflix_app/domain/Downloads/downloads_api_calls.dart';
import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:brot_netflix_app/domain/Search/models/search_response/search_response.dart';
import 'package:brot_netflix_app/domain/Search/search_api_calls.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final DownloadsAPIs _downloadsAPIs;
  final SearchAPIs _searchAPIs;

  SearchBloc(this._downloadsAPIs, this._searchAPIs)
      : super(SearchState.initial()) {
    //Idle State
    on<_Initialize>(
      (event, emit) async {
        if (state.idleList.isNotEmpty) {
          emit(SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false));

          print("SearchIdleList already have values, so returning");
          return;
        }

        //get trending
        print("inside initialized on<>");

        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));

        final _result = await _downloadsAPIs.geDownloadsImage();

        _result.fold(
          (MainFailure f) {
            emit(const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: true));
          },
          (List<Downloads> list) {
            emit(SearchState(
                searchResultList: [],
                idleList: list,
                isLoading: false,
                isError: false));
          },
        );
      },
    );

    //Search Results State
    on<_SearchMovies>(
      (event, emit) async {
        //Display Loading
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));

        //Get Result
        final _result =
            await _searchAPIs.searchMovies(movieQuerry: event.movieQuery);

        //Update State
        _result.fold(
          // In case of Client Failure
          (MainFailure f) {
            emit(const SearchState(
                searchResultList: [],
                idleList: [],
                isLoading: false,
                isError: false));
          },

          // In case of Success
          (SearchResponse r) {
            emit(SearchState(
                searchResultList: r.results,
                idleList: [],
                isLoading: false,
                isError: false));
          },
        );
      },
    );
  }
}
