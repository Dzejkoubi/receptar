import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _top = 380.0;
  double _left = 230.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                print("Navigating to Receptář");
              },
              child: Text("Receptář",
                  style: const TextStyle(
                    fontFamily: 'SourGummy-Black',
                    fontSize: 48,
                    color: StyleConstants.primaryTextColor,
                  )),
            ),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _top = (_top + details.delta.dy)
                      .clamp(50.0, MediaQuery.of(context).size.height - 50);
                  _left = (_left + details.delta.dx)
                      .clamp(5.0, MediaQuery.of(context).size.width - 100);
                });
              },
              child: Transform.rotate(
                angle: 20 * pi / 180,
                child: const StyledSmallText(text: "Klikni na mě👇"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
