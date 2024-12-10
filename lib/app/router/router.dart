import 'package:auto_route/auto_route.dart';
import 'package:receptar/screens/random_recepie_screen/random_recepie_screen.dart';
import 'package:receptar/screens/welcome_screen/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true, children: [
          AutoRoute(page: RandomRecepieRoute.page, path: 'randomRecepie'),
        ])
      ];
}


//For update run: flutter pub run build_runner build
//For watch run: flutter pub run build_runner watch