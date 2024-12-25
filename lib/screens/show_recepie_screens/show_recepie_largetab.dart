import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

class ShowRecepieLargetab extends StatefulWidget {
  const ShowRecepieLargetab({super.key});

  @override
  State<ShowRecepieLargetab> createState() => _ShowRecepieLargetabState();
}

class _ShowRecepieLargetabState extends State<ShowRecepieLargetab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleConstants.primaryColor,
        borderRadius: StyleConstants.borderRadius,
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
            children: [
              const StyledBodyTextImportant(text: "Recept"),
              const StyledBodyText(text: "Popis receptu"),
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
                IconButton(
                  icon: Icon(isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
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
