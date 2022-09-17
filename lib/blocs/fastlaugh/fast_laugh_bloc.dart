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
    on<Initialize>((event, emit) async {
      // Show loading;
      emit(const FastLaughState(
          videosList: [], isLoading: true, isError: false));

      // Get tending movies
      final _result = await _downloadsAPIs.geDownloadsImage();

      final _state = _result.fold((l) {
        return const FastLaughState(
            videosList: [], isLoading: false, isError: true);
      }, (resp) {
        return FastLaughState(
            videosList: resp, isLoading: false, isError: false);
      });

      // Send to UI
      emit(_state);
    });
  }
}
