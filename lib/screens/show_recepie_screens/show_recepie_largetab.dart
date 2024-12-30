import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';

class ShowRecepieLargeTab extends StatefulWidget {
  const ShowRecepieLargeTab({super.key});

  @override
  State<ShowRecepieLargeTab> createState() => _ShowRecepieLargeTabState();
}

class _ShowRecepieLargeTabState extends State<ShowRecepieLargeTab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth;
        return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: StyleConstants.primaryColor,
              borderRadius: StyleConstants.borderRadius,
              boxShadow: StyleConstants.boxShadow,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: StyleConstants.borderRadius.topLeft,
                          bottomRight: StyleConstants.borderRadius.bottomRight),
                      child: Image.asset(
                        "assets/images/food_images/lasagne.png",
                        height: size / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    VerticalSpace(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: StyledBodyTextImportant(text: "Ingredience:"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...List.generate(10, (index) {
                                return StyledBodyText(
                                    text: "Parmigiano-Reggiano$index");
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            StyledBodyTextImportant(text: "Recept"),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                FavoriteButtonWidget(
                                  isFavorite: isFavorite,
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
                                IconButton(
                                  icon: Icon(Icons.fullscreen),
                                  onPressed: () {
                                    AutoRouter.of(context).push(
                                      const ShowRecepieFullRoute(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(5, (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: StyleConstants.lowOpacityTextColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: StyledBodyText(
                                  text: "Tag $index",
                                ),
                              );
                            }),
                          ),
                        ),
                        StyledBodyTextImportant(text: "Postup:"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: StyledBodyText(
                              text:
                                  "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
