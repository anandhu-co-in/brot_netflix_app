import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brot_netflix_app/domain/Downloads/downloads_api_calls.dart';
import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:brot_netflix_app/domain/core/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadsAPIs _downloadsAPIs;

  DownloadsBloc(this._downloadsAPIs) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, downloadsFailureOrSuccessOption: None()));

      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsAPIs.geDownloadsImage();

      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: Some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureOrSuccessOption: Some(Right(success))),
        ),
      );
    });
  }
}
