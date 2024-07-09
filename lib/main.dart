import 'package:flutter/material.dart';
import 'package:mealapp/screens/categoryscreen.dart';

final themes = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.black));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themes,
      home: const CategoryGrid(),
    );
  }
}
