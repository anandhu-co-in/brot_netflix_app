import 'package:brot_netflix_app/domain/Search/models/search_response/search_response.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchAPIs {
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuerry});
}
