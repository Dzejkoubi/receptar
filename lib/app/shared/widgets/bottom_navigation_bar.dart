import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: StyleConstants.lowOpacityTextColor,
        highlightColor: StyleConstants.lowOpacityTextColor,
      ),
      child: BottomNavigationBar(
        backgroundColor: StyleConstants.primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          final List<PageRouteInfo<dynamic>> routes = [
            LikedRecepiesRoute(),
            FindRecepieRoute(),
            RandomRecepieRoute(),
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
