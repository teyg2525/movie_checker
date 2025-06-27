// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_checker/config/app_router.dart' as _i661;
import 'package:movie_checker/services/firebase/firebase_database_service.dart'
    as _i340;
import 'package:movie_checker/services/preferences/preferences_service.dart'
    as _i290;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i661.AppRouter>(() => _i661.AppRouter());
    gh.singleton<_i290.PreferencesService>(() => _i290.PreferencesService());
    gh.lazySingleton<_i340.FirebaseDatabaseService>(
      () => _i340.FirebaseDatabaseService(gh<_i290.PreferencesService>()),
    );
    return this;
  }
}
