import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

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
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: StyleConstants.borderRadius.topLeft,
                          bottomRight: StyleConstants.borderRadius.bottomRight),
                      child: Image.asset(
                        "assets/images/food_images/lasagne.png",
                        height: size / 3,
                        width: size / 3,
                        fit: BoxFit.cover,
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
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: StyleConstants.primaryColor,
                                  title: StyledHeadingText(
                                    text: "Recepie name",
                                  ),
                                  content: StyledBodyText(
                                    text:
                                        "This is a detailed description of the recepie.lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum lorem lorem ipThis is a detailed description of the recepie.lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum lorem lorem ip",
                                  ),
                                  actions: [
                                    TextButton(
                                      child: StyledBodyTextImportant(
                                          text: "Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              StyledBodyTextImportant(text: "Recept"),
                              Icon(
                                Icons.info_outline,
                                color: StyleConstants.secondaryTextColor,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: StyledBodyText(text: "RecepieTag$index"),
                              );
                            }),
                          ),
                        ),
                        StyledBodyTextImportant(text: "Postup"),
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
