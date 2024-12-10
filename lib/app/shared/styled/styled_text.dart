import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';

class StyledHeadingText extends StatelessWidget {
  const StyledHeadingText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'SourGummy',
        fontWeight: FontWeight.w300,
        fontSize: 36,
        color: StyleConstants.primaryTextColor,
      ),
    );
  }
}

class StyledBodyText extends StatelessWidget {
  const StyledBodyText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SourGummy',
        fontSize: 24,
        color: StyleConstants.primaryTextColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class StyledSmallText extends StatelessWidget {
  const StyledSmallText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'SourGummy',
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: StyleConstants.primaryTextColor,
      ),
    );
  }
}
