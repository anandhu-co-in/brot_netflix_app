import 'package:bloc/bloc.dart';
import 'package:brot_netflix_app/domain/Downloads/downloads_api_calls.dart';
import 'package:brot_netflix_app/domain/Downloads/models/downloads.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(DownloadsAPIs _downloadsAPIs)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) {
      // Get ternding movies

      // Send to UI
    });
  }
}
