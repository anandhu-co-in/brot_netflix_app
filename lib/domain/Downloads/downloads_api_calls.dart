import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class DownloadsAPIs {
  Future<Either<MainFailure, List<Downloads>>> geDownloadsImage();
}
