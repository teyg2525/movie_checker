import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/models/movie_model.dart';
import 'package:movie_checker/services/preferences/preferences_service.dart';
import 'package:result_dart/result_dart.dart';

@LazySingleton()
class FirebaseDatabaseService {
  static const _appName = 'movie-checker';
  static const _moviesKey = 'movies';

  final PreferencesService _preferencesService;

  final Completer<FirebaseApp> _appInitializationCompleter;

  late StreamSubscription _moviesUpdatedSubscription;
  final StreamController<List<MovieModel>> _moviesUpdatedController;

  FirebaseDatabase? _databaseInstance;
  Future<FirebaseDatabase> get _database async =>
      _databaseInstance ??= await _getDB();

  FirebaseDatabaseService(this._preferencesService)
    : _moviesUpdatedController = StreamController.broadcast(),
      _appInitializationCompleter = Completer() {
    Firebase.initializeApp(
      name: _appName,
    ).then((app) => _appInitializationCompleter.complete(app));

    // _database.then((db) {
    //   _moviesUpdatedSubscription = db.ref(_moviesKey).onValue.listen((event) {
    //     if (event.snapshot.exists && event.snapshot.value != null) {
    //       final movies = _parseMoviesFromSnapshot(event.snapshot);

    //       _moviesUpdatedController.add(movies);
    //     }
    //   });
    // });
  }

  Stream<List<MovieModel>> get moviesUpdatedStream =>
      _moviesUpdatedController.stream;

  Future<Result<List<MovieModel>, String>> getMovies() async {
    Result<List<MovieModel>, String> result;

    try {
      final db = await _database;
      final snapshot = await db.ref(_moviesKey).get();

      if (snapshot.exists && snapshot.value != null) {
        final movies = _parseMoviesFromSnapshot(snapshot);
        result = Result.success(movies);
      } else {
        result = Result.success([]);
      }
    } catch (ex) {
      result = Result.failure(ex.toString());
    }

    return result;
  }

  Future<Result> addMovie(MovieModel movie) async {
    Result result;

    try {
      final db = await _database;
      final json = jsonEncode(movie.toJson());
      await db.ref(_moviesKey).push().set(json);

      result = Result.success(1);
    } catch (ex) {
      result = Result.failure(ex.toString());
    }

    return result;
  }

  List<MovieModel> _parseMoviesFromSnapshot(DataSnapshot snapshot) {
    final json = jsonDecode(snapshot.value as dynamic);
    final movies = (json as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();

    return movies;
  }

  Future<FirebaseDatabase> _getDB() async {
    final app = await _appInitializationCompleter.future;
    final url = await _preferencesService.getFirebaseDBUrl();
    final db = FirebaseDatabase.instanceFor(app: app, databaseURL: url);

    return db;
  }
}
