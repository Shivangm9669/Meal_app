import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget con = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, indx) => MealItem(meal: meals[indx]));

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
