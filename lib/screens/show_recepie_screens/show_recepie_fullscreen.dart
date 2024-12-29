import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/youtube_video_widget.dart';

@RoutePage()
class ShowRecepieFullScreen extends StatefulWidget {
  const ShowRecepieFullScreen({super.key});

  @override
  State<ShowRecepieFullScreen> createState() => _ShowRecepieFullScreenState();
}

class _ShowRecepieFullScreenState extends State<ShowRecepieFullScreen> {
  bool isFavorite = false;

  // List to track ingredient checkboxes
  List<bool> checkedIngredients = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
          backgroundColor: StyleConstants.backgroundColor,
          title: const StyledHeadingText(text: "Recept"),
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
                videoUrl: "https://www.youtube.com/watch?v=gfhfsBPt46s",
              ),
              const VerticalSpace(height: 16),

              // Tags - Horizontal Scroll Bar
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: StyleConstants.secondaryTextColor
                              .withOpacity(0.1),
                          borderRadius: StyleConstants.borderRadius,
                        ),
                        child: StyledBodyText(
                          text: "Tag $index",
                        ),
                      );
                    }),
                  ),
                ),
              ),
              VerticalSpace(height: 16),

              // Ingredients Section
              const StyledBodyTextImportant(text: "Ingredience:"),
              VerticalSpace(height: 8),
              ListView.builder(
                shrinkWrap:
                    true, // Needed for use inside a SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: StyledBodyText(
                      text: "Ingredient ${index + 1}",
                    ),
                    value: checkedIngredients[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkedIngredients[index] = value!;
                      });
                    },
                    controlAffinity:
                        ListTileControlAffinity.leading, // Checkbox on the left
                  );
                },
              ),
              const SizedBox(height: 16),

              // Steps Section
              const StyledBodyTextImportant(text: "Postup:"),
              const SizedBox(height: 8),
              StyledBodyText(
                text:
                    "1. Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\n\n"
                    "2. In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\n\n"
                    "3. Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
