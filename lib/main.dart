import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/providers/liked_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LikedProvider(),
        ),
      ],
      child: App(),
    ),
  );
  ;
}

class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
