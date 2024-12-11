import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({required this.currentIndex, super.key});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: StyleConstants.primaryColor,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.router.pushAndPopUntil(
              const LikedRecepiesRoute(),
              predicate: (route) => false,
            );
            break;
          case 1:
            context.router.pushAndPopUntil(
              const FindRecepieRoute(),
              predicate: (route) => false,
            );
            break;
          case 2:
            context.router.pushAndPopUntil(
              const RandomRecepieRoute(),
              predicate: (route) => false,
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Oblíbené',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Najít',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shuffle),
          label: 'Náhodný',
        ),
      ],
      // Styles
      enableFeedback: true,
      // Selected
      fixedColor: StyleConstants.primaryTextColor,
      // Unselected
      unselectedItemColor: StyleConstants.secondaryTextColor,
    );
  }
}
