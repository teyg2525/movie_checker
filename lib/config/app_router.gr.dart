// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:movie_checker/screens/add_movie/add_movie_screen.dart' as _i1;
import 'package:movie_checker/screens/home/home_screen.dart' as _i2;
import 'package:movie_checker/screens/initial/initial_screen.dart' as _i3;
import 'package:movie_checker/screens/movie/movie_screen.dart' as _i4;
import 'package:movie_checker/screens/settings/settings_screen.dart' as _i5;

/// generated route for
/// [_i1.AddMovieScreen]
class AddMovieRoute extends _i6.PageRouteInfo<void> {
  const AddMovieRoute({List<_i6.PageRouteInfo>? children})
    : super(AddMovieRoute.name, initialChildren: children);

  static const String name = 'AddMovieRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddMovieScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.InitialScreen]
class InitialRoute extends _i6.PageRouteInfo<void> {
  const InitialRoute({List<_i6.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.InitialScreen();
    },
  );
}

/// generated route for
/// [_i4.MovieScreen]
class MovieRoute extends _i6.PageRouteInfo<MovieRouteArgs> {
  MovieRoute({
    required String title,
    required String review,
    required bool watched,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         MovieRoute.name,
         args: MovieRouteArgs(
           title: title,
           review: review,
           watched: watched,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'MovieRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieRouteArgs>();
      return _i4.MovieScreen(
        title: args.title,
        review: args.review,
        watched: args.watched,
        key: args.key,
      );
    },
  );
}

class MovieRouteArgs {
  const MovieRouteArgs({
    required this.title,
    required this.review,
    required this.watched,
    this.key,
  });

  final String title;

  final String review;

  final bool watched;

  final _i7.Key? key;

  @override
  String toString() {
    return 'MovieRouteArgs{title: $title, review: $review, watched: $watched, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieRouteArgs) return false;
    return title == other.title &&
        review == other.review &&
        watched == other.watched &&
        key == other.key;
  }

  @override
  int get hashCode =>
      title.hashCode ^ review.hashCode ^ watched.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsScreen();
    },
  );
}
