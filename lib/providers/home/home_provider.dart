import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/models/movie_model.dart';
import 'package:movie_checker/services/firebase/firebase_database_service.dart';
import 'package:result_dart/result_dart.dart';

@Injectable()
class HomeProvider extends ChangeNotifier {
  final FirebaseDatabaseService _databaseService;

  StreamSubscription<List<MovieModel>>? _moviesUpdatedSubscription;

  HomeProvider(this._databaseService) {
    _moviesUpdatedSubscription = _databaseService.moviesUpdatedStream.listen(
      _onMoviesUpdated,
    );
    _init();
  }

  bool initialized = false;
  List<MovieModel> movies = List.empty(growable: true);

  _init() {
    refresh();
  }

  Future refresh() async {
    await _databaseService
        .getMovies()
        .onSuccess((movies) {
          this.movies = movies;
          initialized = true;
          notifyListeners();
        })
        .onFailure((error) {
          //TODO: implement error handling
        });
  }

  _onMoviesUpdated(List<MovieModel> movies) {
    this.movies = movies;
    notifyListeners();
  }
}
