import 'package:auto_route/auto_route.dart';
import 'package:receptar/screens/random_recepie_screen/random_recepie_screen.dart';
import 'package:receptar/screens/liked_recepies_screen/liked_recepies_screen.dart';
import 'package:receptar/screens/find_recepie_screen/find_recepie_screen.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_fullscreen.dart';
import 'package:receptar/screens/welcome_screen/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: WelcomeRoute.page,
          initial: true,
          path: '/',
        ),
        CustomRoute(
          page: RandomRecepieRoute.page,
          path: '/randomRecepie',
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: LikedRecepiesRoute.page,
          path: '/likedRecepies',
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: FindRecepieRoute.page,
          path: '/findRecepie',
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: ShowRecepieRoute.page,
          path: '/recepie',
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
        ),
      ];
}

// For update run: flutter pub run build_runner build
// For watch run: flutter pub run build_runner watch