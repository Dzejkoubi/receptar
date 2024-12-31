import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';

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
    required this.onCollapse,
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
  final VoidCallback onCollapse;

  @override
  State<ShowRecepieLargeTab> createState() => _ShowRecepieLargeTabState();
}

class _ShowRecepieLargeTabState extends State<ShowRecepieLargeTab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) => widget.onCollapse(),
      child: LayoutBuilder(builder: (context, constraints) {
        double size = constraints.maxWidth;
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: StyleConstants.primaryColor,
            borderRadius: StyleConstants.borderRadius,
          ),
          child: Row(
            children: [
              // Left Column with photo + ingredients
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Large image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: StyleConstants.borderRadius.topLeft,
                      bottomRight: StyleConstants.borderRadius.bottomRight,
                    ),
                    child: Image.network(
                      widget.thumbPhoto.toString(),
                      height: size / 2,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: size / 2,
                          color: Colors.grey,
                          child: const Icon(Icons.image_not_supported_rounded),
                        );
                      },
                    ),
                  ),

                  VerticalSpace(height: 8),

                  // Ingredients title
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: StyledBodyTextImportant(text: "Ingrediencies:"),
                  ),

                  // Scrollable list of ingredients
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(widget.ingredients.length,
                                (index) {
                              return StyledBodyText(
                                text: widget.ingredients[index],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  VerticalSpace(height: 8)
                ],
              ),

              // Right Column with details & steps
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row with Title + Buttons
                      Row(
                        children: [
                          StyledBodyTextImportant(text: widget.name),
                          const Spacer(),

                          // Favorite Button
                          FavoriteButtonWidget(
                            isFavorite: isFavorite,
                            onChanged: (newValue) {
                              setState(() {
                                isFavorite = newValue;
                              });
                            },
                          ),
                          // Collapse icon triggers the callback
                          IconButton(
                            icon: const Icon(Icons.fullscreen),
                            onPressed: () {
                              AutoRouter.of(context).push(
                                ShowRecepieFullRoute(),
                              );
                            },
                          ),
                        ],
                      ),

                      // Tags row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(widget.tags.length, (index) {
                              return _buildTag(widget.tags[index]);
                            }),
                            _buildTag(widget.category),
                            _buildTag(widget.area),
                          ],
                        ),
                      ),

                      VerticalSpace(height: 8),

                      // Steps
                      StyledBodyTextImportant(text: "Steps:"),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(widget.steps.length, (index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StyledBodyText(
                                      text:
                                          "${index + 1}. ${widget.steps[index]}",
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
          ),
        );
      }),
    );
  }

  Widget _buildTag(String? text) {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: StyleConstants.lowOpacityTextColor,
        borderRadius: StyleConstants.borderRadius,
      ),
      child: StyledBodyText(text: text.toString()),
    );
  }
}
