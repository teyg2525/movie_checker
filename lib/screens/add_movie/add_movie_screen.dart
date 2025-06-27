import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_checker/components/custom_back_button.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/providers/add_movie/add_movie_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onPressed: () => context.router.back()),
        title: Text(
          localization.settings,
          style: textStyles.roboto18MediumMain,
        ),
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => GetIt.instance.get<AddMovieProvider>(),
        builder: (context, child) {
          final provider = context.watch<AddMovieProvider>();

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: []),
            ),
          );
        },
      ),
    );
  }
}
