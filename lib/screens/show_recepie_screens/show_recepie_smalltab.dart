import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';

class ShowRecepieSmallTab extends StatefulWidget {
  const ShowRecepieSmallTab({super.key});

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
            child: Image.asset(
              "assets/images/food_images/lasagne.png",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
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
              const StyledBodyTextImportant(text: "Recept"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: StyleConstants.secondaryTextColor
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: StyledBodyText(
                          text: "Tag $index",
                        ),
                      );
                    })
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
                          const ShowRecepieFullRoute(),
                        );
                      },
                    ),
                  ],
                ),
                StyledBodyText(text: "Pokročilé"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
