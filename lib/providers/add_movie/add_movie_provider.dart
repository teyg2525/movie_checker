import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/models/movie_model.dart';
import 'package:movie_checker/services/firebase/firebase_database_service.dart';
import 'package:result_dart/result_dart.dart';

@Injectable()
class AddMovieProvider extends ChangeNotifier {
  final FirebaseDatabaseService _firebaseDatabaseService;

  AddMovieProvider(this._firebaseDatabaseService);

  bool addingInProgress = false;

  Future<Result> addMovie(String title, String review, bool watched) async {
    addingInProgress = true;
    notifyListeners();

    final movie = MovieModel(title: title, review: review, watched: watched);

    final result = await _firebaseDatabaseService.addMovie(movie);

    addingInProgress = false;
    notifyListeners();

    return result;
  }
}
