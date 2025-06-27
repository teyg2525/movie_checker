import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_checker/components/loading_widget.dart';
import 'package:movie_checker/config/app_router.gr.dart';
import 'package:movie_checker/providers/app_config/app_config_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) => _init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: LoadingWidget());

  _init() async {
    final configProvider = context.read<AppConfigProvider>();
    await Future.wait([
      configProvider.adjustCurrentBrightnessToSaved(
        Theme.of(context).brightness,
      ),
      configProvider.adjustCurrentLanguageToSaved(),
    ]);

    if (mounted) {
      context.router.replace(HomeRoute());
    }
  }
}
