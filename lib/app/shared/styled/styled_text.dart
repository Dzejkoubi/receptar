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
        fontFamily: 'SourGummy-Black',
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
        fontFamily: 'SourGummy-Regular',
        fontSize: 32,
        color: StyleConstants.primaryTextColor,
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
        fontFamily: 'SourGummy-Light',
        fontSize: 24,
        color: StyleConstants.primaryTextColor,
      ),
    );
  }
}
