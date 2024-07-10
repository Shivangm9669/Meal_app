import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget con = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, indx) => Text(meals[indx].title));

    if (meals.isEmpty) {
      con = const Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Oopss....."),
          SizedBox(
            height: 20,
          ),
          Text("There is no meal present")
        ],
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: con);
  }
}
