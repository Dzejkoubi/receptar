import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/app/shared/widgets/styled_divider.dart';
import 'package:receptar/app/shared/widgets/youtube_video_widget.dart';
import 'package:receptar/providers/liked_provider.dart';

@RoutePage()
class ShowRecepieFullScreen extends StatefulWidget {
  const ShowRecepieFullScreen({
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
  State<ShowRecepieFullScreen> createState() => _ShowRecepieFullScreenState();
}

class _ShowRecepieFullScreenState extends State<ShowRecepieFullScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<LikedProvider>().isLiked(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
          backgroundColor: StyleConstants.backgroundColor,
          title: StyledHeadingText(text: widget.name),
          actions: [
            FavoriteButtonWidget(
              isFavorite: isFavorite,
              onChanged: (newValue) {
                setState(() {
                  isFavorite = newValue;
                });
                if (context.read<LikedProvider>().isLiked(widget.id)) {
                  context.read<LikedProvider>().removeRecipe(widget.id);
                } else {
                  context.read<LikedProvider>().addRecipe(widget.id);
                }
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubeVideoWidget(
                videoUrl: widget.youtubeLink ?? '',
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
                        widget.tags.length,
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
                              color: StyleConstants.primaryColor,
                              borderRadius: StyleConstants.borderRadius,
                            ),
                            child: StyledBodyTextImportant(
                              text: widget.tags[index],
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
                          color: StyleConstants.primaryColor,
                          borderRadius: StyleConstants.borderRadius,
                        ),
                        child: StyledBodyTextImportant(
                          text: widget.category ?? '',
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
                          color: StyleConstants.primaryColor,
                          borderRadius: StyleConstants.borderRadius,
                        ),
                        child: StyledBodyTextImportant(
                          text: widget.area ?? '',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StyledDivider(),

              Container(
                  decoration: BoxDecoration(
                    color: StyleConstants.primaryColor,
                    borderRadius: StyleConstants.borderRadius,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Center(
                        child: StyledBodyTextImportant(
                          text: "Ingredients",
                        ),
                      ),
                      Builder(builder: (context) {
                        return Column(
                          children:
                              List.generate(widget.ingredients.length, (index) {
                            return Row(
                              children: [
                                StyledBodyText(
                                    text:
                                        "${widget.ingredients[index]} - ${widget.measures[index]}"),
                              ],
                            );
                          }),
                        );
                      }),
                    ],
                  )),
              StyledDivider(),
              Container(
                decoration: BoxDecoration(
                  color: StyleConstants.primaryColor,
                  borderRadius: StyleConstants.borderRadius,
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    StyledBodyTextImportant(
                      text: "Steps",
                    ),
                    ...List.generate(widget.steps.length, (index) {
                      return Column(
                        children: [
                          StyledBodyText(
                            text: "${index + 1}. ${widget.steps[index]}",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              StyledDivider(),
              Center(
                child: Column(
                  children: [
                    StyledBodyTextImportant(
                      text: "AND THAT'S IT!",
                    ),
                    VerticalSpace(height: 8),
                    StyledButton(
                      text: "Back",
                      icon: Icons.arrow_back,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    VerticalSpace(height: 32)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
