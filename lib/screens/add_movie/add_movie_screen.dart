import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_checker/components/custom_back_button.dart';
import 'package:movie_checker/components/custom_button.dart';
import 'package:movie_checker/components/custom_text_field.dart';
import 'package:movie_checker/components/scroll_layout_expander.dart';
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
  late TextEditingController _titleController;
  late TextEditingController _reviewController;

  bool watched = false;

  @override
  void initState() {
    _titleController = TextEditingController();
    _reviewController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _reviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CustomBackButton(onPressed: () => context.router.back()),
        ),
        title: Text(localization.add, style: textStyles.roboto18MediumMain),
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
        leadingWidth: 100,
      ),
      body: ChangeNotifierProvider(
        create: (_) => GetIt.instance.get<AddMovieProvider>(),
        builder: (context, child) {
          final provider = context.watch<AddMovieProvider>();

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ScrollLayoutExpander(
                      child: Column(
                        children: [
                          CustomTextField(
                            title: localization.title,
                            controller: _titleController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            title: localization.review,
                            controller: _reviewController,
                            maxLines: null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                localization.watched,
                                style: textStyles.roboto16RegularMain,
                              ),
                              Switch(
                                activeColor: textStyles.ctaDefaultColor,
                                value: watched,
                                onChanged: (value) =>
                                    setState(() => watched = !watched),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    label: localization.add,
                    isLoading: provider.addingInProgress,
                    onPressed: () => _onAdd(provider),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onAdd(AddMovieProvider provider) {
    provider
        .addMovie(_titleController.text, _reviewController.text, watched)
        .then((result) {
          result
              .onSuccess((_) {
                context.router.pop();
              })
              .onFailure((error) {
                //TODO: handle error
              });
        });
  }
}
