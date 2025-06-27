import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_checker/config/app_router.dart';
import 'package:movie_checker/l10n/app_localizations.dart';
import 'package:movie_checker/providers/app_config/app_config_provider.dart';
import 'package:movie_checker/style/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => GetIt.instance.get<AppConfigProvider>(),
      ),
    ],
    builder: (context, child) {
      final appConfig = context.watch<AppConfigProvider>();

      return MaterialApp.router(
        routerConfig: GetIt.instance.get<AppRouter>().config(),
        theme: ThemeData.from(
          useMaterial3: false,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData.from(
          useMaterial3: false,
          colorScheme: darkColorScheme,
        ),
        themeMode: switch (appConfig.brightness) {
          Brightness.light => ThemeMode.light,
          Brightness.dark => ThemeMode.dark,
        },
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: appConfig.language.value,
      );
    },
  );
}
