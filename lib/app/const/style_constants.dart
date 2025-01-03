import 'package:flutter/material.dart';

class StyleConstants {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 250, 250, 154);
  static const Color backgroundColor = Color.fromARGB(255, 241, 207, 55);
  static const Color primaryTextColor = Colors.black;
  static const Color secondaryTextColor = Colors.black45;
  static const Color lowOpacityTextColor = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color accentColor = Color(0xFF00BFA5);

  // Text Styles
  static const TextStyle headingTextStyle = TextStyle(
    fontFamily: 'Baloo_2',
    fontWeight: FontWeight.w800,
    fontSize: 36,
    color: primaryTextColor,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontFamily: 'Baloo_2',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: primaryTextColor,
  );

  // Border Radius
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(20));

  // Shadows
  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 5,
      offset: Offset(0, 8),
    ),
  ];

  // Padding and Margins
  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.all(16.0);
}
