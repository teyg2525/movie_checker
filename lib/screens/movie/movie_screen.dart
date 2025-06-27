import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_checker/components/custom_back_button.dart';
import 'package:movie_checker/components/watched_indicator.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/models/movie_model.dart';

@RoutePage()
class MovieScreen extends StatelessWidget {
  const MovieScreen({
    required this.title,
    required this.review,
    required this.watched,
    super.key,
  });

  final String title;
  final String review;
  final bool watched;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onPressed: () => context.router.back()),
        title: Text(localization.movies, style: textStyles.roboto18MediumMain),
        actions: [WatchedIndicator(watched: watched)],
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
        leadingWidth: 100,
        actionsPadding: EdgeInsets.all(16),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title, style: textStyles.roboto18MediumMain),
              const SizedBox(height: 16),
              Text(review, style: textStyles.roboto16RegularSecondary),
            ],
          ),
        ),
      ),
    );
  }

  factory MovieScreen.fromMovie(MovieModel movie) => MovieScreen(
    title: movie.title,
    review: movie.review,
    watched: movie.watched,
  );
}
