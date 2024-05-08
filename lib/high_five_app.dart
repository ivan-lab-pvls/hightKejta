import 'package:flutter/material.dart';
import 'package:high_five_app/router/router.dart';

class HighFiveApp extends StatelessWidget {
  HighFiveApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
