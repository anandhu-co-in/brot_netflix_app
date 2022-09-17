// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../blocs/downloads/downloads_bloc.dart' as _i5;
import '../../../blocs/fastlaugh/fast_laugh_bloc.dart' as _i6;
import '../../../blocs/search/search_bloc.dart' as _i9;
import '../../../infrastructure/downloads/downloads_api_call_impl.dart' as _i4;
import '../../../infrastructure/search/search_api_impl.dart' as _i8;
import '../../Downloads/downloads_api_calls.dart' as _i3;
import '../../Search/search_api_calls.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DownloadsAPIs>(() => _i4.DownloadsAPIImpl());
  gh.factory<_i5.DownloadsBloc>(
      () => _i5.DownloadsBloc(get<_i3.DownloadsAPIs>()));
  gh.factory<_i6.FastLaughBloc>(
      () => _i6.FastLaughBloc(get<_i3.DownloadsAPIs>()));
  gh.lazySingleton<_i7.SearchAPIs>(() => _i8.SearchAPIImpl());
  gh.factory<_i9.SearchBloc>(
      () => _i9.SearchBloc(get<_i3.DownloadsAPIs>(), get<_i7.SearchAPIs>()));
  return get;
}
