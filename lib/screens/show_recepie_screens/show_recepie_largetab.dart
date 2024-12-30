import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/models/test_mode.dart';

class ShowRecepieLargeTab extends StatefulWidget {
  const ShowRecepieLargeTab({
    required this.id,
    required this.name,
    this.category,
    this.area,
    required this.steps,
    this.thumbPhoto,
    required this.tags,
    this.youtubeLink,
    required this.ingredients,
    required this.measures,
    super.key,
  });

  final String id;
  final String name;
  final String? category;
  final String? area;
  final List<String> steps;
  final String? thumbPhoto;
  final List<String> tags;
  final String? youtubeLink;
  final List<String> ingredients;
  final List<String> measures;

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
                      child: Image.network(
                        widget.thumbPhoto.toString() ?? '',
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
                              ...List.generate(widget.ingredients.length,
                                  (index) {
                                return StyledBodyText(
                                    text: widget.ingredients[index]);
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
                            StyledBodyTextImportant(text: widget.name),
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
                          child: Row(children: [
                            ...List.generate(widget.tags.length, (index) {
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
                                  text: widget.tags[index],
                                ),
                              );
                            }),
                            Container(
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
                                text: widget.category.toString(),
                              ),
                            ),
                            Container(
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
                                text: widget.area.toString(),
                              ),
                            ),
                          ]),
                        ),
                        StyledBodyTextImportant(text: "Postup:"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(widget.steps.length, (index) {
                                  return Column(
                                    children: [
                                      StyledBodyText(
                                        text:
                                            "${index + 1}. ${widget.steps[index]}",
                                      ),
                                      VerticalSpace(
                                        height: 8,
                                      ),
                                    ],
                                  );
                                }),
                                Center(
                                    child: StyledButton(
                                  text: "Full Screen",
                                  icon: Icons.fullscreen,
                                  onPressed: () {
                                    AutoRouter.of(context).push(
                                      const ShowRecepieFullRoute(),
                                    );
                                  },
                                ))
                              ],
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
