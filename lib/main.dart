import 'package:flutter/material.dart';
import 'package:spec/home_screen.dart';
import 'package:spec/start_screen.dart';
import 'package:spec/planet_details_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (_) => const StartScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        PlanetDetailsScreen.routeName: (_) => const PlanetDetailsScreen(),
      },
    );
  }
}