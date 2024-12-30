import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/styled_divider.dart';
import 'package:receptar/app/shared/widgets/youtube_video_widget.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/models/test_mode.dart';

@RoutePage()
class ShowRecepieFullScreen extends StatefulWidget {
  const ShowRecepieFullScreen({super.key});

  @override
  State<ShowRecepieFullScreen> createState() => _ShowRecepieFullScreenState();
}

class _ShowRecepieFullScreenState extends State<ShowRecepieFullScreen> {
  bool isFavorite = false;

  final Meal testMeal = MealTest.testMeal();
  final Map testMealMap = MealTest.testMeal().toMap();

  List<bool> checkListValues = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkListValues =
        List.generate(testMealMap["ingredients"].length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
          backgroundColor: StyleConstants.backgroundColor,
          title: StyledHeadingText(text: testMealMap["name"]),
          actions: [
            FavoriteButtonWidget(
              isFavorite: isFavorite,
              size: 28,
              onChanged: (newValue) {
                setState(() {
                  isFavorite = newValue;
                });

                // Additional logic for handling favorites
                // DO LATER
                if (newValue) {
                  print("Added to favorites!");
                } else {
                  print("Removed from favorites!");
                }
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubeVideoWidget(
                videoUrl: testMealMap["youtubeLink"],
              ),
              const VerticalSpace(height: 16),

              // Tags - Horizontal Scroll Bar
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                        testMealMap["tags"].length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              color: StyleConstants.lowOpacityTextColor,
                              borderRadius: StyleConstants.borderRadius,
                            ),
                            child: StyledBodyText(
                              text: testMealMap["tags"][index],
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: StyleConstants.lowOpacityTextColor,
                          borderRadius: StyleConstants.borderRadius,
                        ),
                        child: StyledBodyText(
                          text: testMealMap["category"],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: StyleConstants.lowOpacityTextColor,
                          borderRadius: StyleConstants.borderRadius,
                        ),
                        child: StyledBodyText(
                          text: testMealMap["area"],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StyledDivider(),

              VerticalSpace(
                height: 16,
              ),
              StyledBodyTextImportant(text: "Ingredients"),
              Builder(builder: (context) {
                return Column(
                  children:
                      List.generate(testMealMap["ingredients"].length, (index) {
                    return Row(
                      children: [
                        StyledBodyText(
                            text:
                                "${testMealMap["ingredients"][index]} - ${testMealMap["measures"][index]}"),
                      ],
                    );
                  }),
                );
              }),
              StyledDivider(),
              Column(
                children: [
                  StyledBodyTextImportant(
                    text: "Steps",
                  ),
                  ...List.generate(testMealMap["steps"].length, (index) {
                    return Column(
                      children: [
                        StyledBodyText(
                          text: "${index + 1}. ${testMealMap["steps"][index]}",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              StyledDivider(),
              Center(
                child: StyledBodyTextImportant(
                  text: "AND THAT'S IT!",
                ),
              ),
              VerticalSpace(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
