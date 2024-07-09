import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key , required this.title , required this.meals });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
