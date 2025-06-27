import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/services/preferences/preferences_service.dart';

@LazySingleton()
class FirebaseDatabaseService {
  static const _appName = 'movie-checker';

  final PreferencesService _preferencesService;

  FirebaseDatabase? _databaseInstance;

  FirebaseDatabaseService(this._preferencesService);

  Future<FirebaseDatabase> get _database async =>
      _databaseInstance ??= await _getDB();

  Future<FirebaseDatabase> _getDB() async {
    final app = Firebase.app(_appName);
    final url = await _preferencesService.getFirebaseDBUrl();
    final db = FirebaseDatabase.instanceFor(app: app, databaseURL: url);

    return db;
  }
}
