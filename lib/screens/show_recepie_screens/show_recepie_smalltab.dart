import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

class ShowRecepieSmalltab extends StatefulWidget {
  const ShowRecepieSmalltab({super.key});

  @override
  State<ShowRecepieSmalltab> createState() => _ShowRecepieSmalltabState();
}

class _ShowRecepieSmalltabState extends State<ShowRecepieSmalltab> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleConstants.primaryColor,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/food_images/lasagne.png",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Column(
            children: [
              const StyledBodyTextImportant(text: "Recept"),
              const StyledBodyText(text: "Popis receptu"),
            ],
          )),
          // Divider(
          //   color: StyleConstants.secondaryTextColor,
          //   thickness: 2,
          // ),
          Column(
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
          )
        ],
      ),
    );
  }
}
