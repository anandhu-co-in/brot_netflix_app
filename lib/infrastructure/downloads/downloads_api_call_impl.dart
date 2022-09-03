import 'package:brot_netflix_app/domain/Downloads/downloads_api_calls.dart';
import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:brot_netflix_app/domain/core/api_end_points.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DownloadsAPIImpl implements DownloadsAPIs {
  @override
  Future<Either<MainFailure, List<Downloads>>> geDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];

        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
