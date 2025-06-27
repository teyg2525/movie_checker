import 'package:flutter/material.dart';
import 'package:movie_checker/app.dart';
import 'package:movie_checker/config/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(App());
}
