// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:movie_checker/screens/add_movie_screen/add_movie_screen.dart'
    as _i1;
import 'package:movie_checker/screens/home/home_screen.dart' as _i2;
import 'package:movie_checker/screens/initial/initial_screen.dart' as _i3;
import 'package:movie_checker/screens/settings/settings_screen.dart' as _i4;

/// generated route for
/// [_i1.AddMovieScreen]
class AddMovieRoute extends _i5.PageRouteInfo<void> {
  const AddMovieRoute({List<_i5.PageRouteInfo>? children})
    : super(AddMovieRoute.name, initialChildren: children);

  static const String name = 'AddMovieRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddMovieScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.InitialScreen]
class InitialRoute extends _i5.PageRouteInfo<void> {
  const InitialRoute({List<_i5.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.InitialScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}
