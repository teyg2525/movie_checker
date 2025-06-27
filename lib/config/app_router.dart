import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/config/app_router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: InitialRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: AddMovieRoute.page),
    AutoRoute(page: MovieRoute.page),
  ];
}
