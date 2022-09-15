import 'dart:developer';

import 'package:brot_netflix_app/domain/Search/models/search_response/search_response.dart';
import 'package:brot_netflix_app/domain/Search/search_api_calls.dart';
import 'package:brot_netflix_app/domain/core/api_end_points.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchAPIs)
class SearchAPIImpl implements SearchAPIs {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuerry}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuerry,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        // log(response.data.toString());
        // print(downloadsList);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
