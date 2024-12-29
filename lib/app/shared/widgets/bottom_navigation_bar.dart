import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: StyleConstants.secondaryTextColor.withOpacity(0.1),
        highlightColor: StyleConstants.primaryTextColor.withOpacity(0.1),
      ),
      child: BottomNavigationBar(
        backgroundColor: StyleConstants.primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          final routes = [
            const LikedRecepiesRoute(),
            const FindRecepieRoute(),
            const RandomRecepieRoute(),
          ];
          context.router.pushAndPopUntil(
            routes[index],
            predicate: (route) => false,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: 'Oblíbené',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Najít',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shuffle_rounded),
            label: 'Náhodný',
          ),
        ],
        // Styles
        enableFeedback: true,
        // Selected
        fixedColor: StyleConstants.primaryTextColor,
        // Unselected
        unselectedItemColor: StyleConstants.secondaryTextColor,
      ),
    );
  }
}
