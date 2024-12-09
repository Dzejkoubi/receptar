import 'package:auto_route/auto_route.dart';
import 'package:receptar/screens/welcome_screen/welcome_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: WelcomeRoute.page, initial: true)];
}


//For update run: flutter pub run build_runner build
//For watch run: flutter pub run build_runner watch