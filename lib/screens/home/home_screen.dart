import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_checker/components/empty_state_widget.dart';
import 'package:movie_checker/components/loading_widget.dart';
import 'package:movie_checker/components/svg_image_button.dart';
import 'package:movie_checker/components/watched_indicator.dart';
import 'package:movie_checker/config/app_router.gr.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/gen/assets.gen.dart';
import 'package:movie_checker/models/movie_model.dart';
import 'package:movie_checker/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.movies, style: textStyles.roboto18MediumMain),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgImageButton(
              onPressed: () => context.router.push(SettingsRoute()),
              asset: Assets.icons.settings,
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => GetIt.instance.get<HomeProvider>(),
        builder: (context, child) {
          final provider = context.watch<HomeProvider>();
          final movies = provider.movies;

          return SafeArea(
            child: provider.initialized
                ? provider.movies.isEmpty
                      ? EmptyStateWidget(localization.noMoviesMessage)
                      : RefreshIndicator.adaptive(
                          onRefresh: provider.refresh,
                          child: ListView.separated(
                            itemCount: movies.length,
                            padding: const EdgeInsets.all(16),
                            itemBuilder: (context, index) {
                              final movie = movies[index];

                              return InkWell(
                                onTap: () => _movieTapped(context, movie),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: textStyles.roboto16MediumMain,
                                    ),
                                    WatchedIndicator(watched: movie.watched),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Divider(color: scheme.lineColor),
                            physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                          ),
                        )
                : LoadingWidget(),
          );
        },
      ),
      floatingActionButton: SvgImageButton(
        onPressed: () => _addMovieTapped(context),
        asset: Assets.icons.add,
        size: 50,
      ),
    );
  }

  _movieTapped(BuildContext context, MovieModel movie) {
    context.router.push(
      MovieRoute(
        title: movie.title,
        review: movie.review,
        watched: movie.watched,
      ),
    );
  }

  _addMovieTapped(BuildContext context) {
    context.router.push(AddMovieRoute());
  }
}
