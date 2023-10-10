import 'package:flutter/material.dart';
import 'package:portfolio_higor/src/home_page.dart';
import 'package:portfolio_higor/src/shared/themes/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class ThemeManager {
  static void changeTheme(ThemeData newTheme) {
    final currentTheme = newTheme.copyWith();
    runApp(
      MaterialApp(
        title: 'Portfolio Higor',
        debugShowCheckedModeBanner: false,
        theme: currentTheme,
        darkTheme: currentTheme,
        home: const HomePage(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Higor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: const HomePage(),
    );
  }
}
