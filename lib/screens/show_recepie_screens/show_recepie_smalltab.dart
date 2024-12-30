import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/models/test_mode.dart';

class ShowRecepieSmallTab extends StatefulWidget {
  const ShowRecepieSmallTab({
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
  State<ShowRecepieSmallTab> createState() => _ShowRecepieSmallTabState();
}

class _ShowRecepieSmallTabState extends State<ShowRecepieSmallTab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: StyleConstants.primaryColor,
        borderRadius: StyleConstants.borderRadius,
        boxShadow: StyleConstants.boxShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: StyleConstants.borderRadius.topLeft,
                bottomLeft: StyleConstants.borderRadius.bottomLeft),
            child: Image.network(
              widget.thumbPhoto.toString() ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image_not_supported_rounded),
                );
              },
            ),
          ),
          Container(
            width: 1,
            height: 100,
            color: StyleConstants.secondaryTextColor,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledBodyTextImportant(text: widget.name),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
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
                  ],
                ),
              )
            ],
          )),
          Container(
            width: 1,
            height: 100,
            color: StyleConstants.secondaryTextColor,
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          ShowRecepieFullRoute(),
                        );
                      },
                    ),
                  ],
                ),
                StyledBodyText(
                  text: "${widget.ingredients.length} ing.",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
