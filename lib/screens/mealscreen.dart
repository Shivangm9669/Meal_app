import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/mealdetails.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meals , required this.toggleFavList});

  final void Function(Meal meal) toggleFavList;
  final String? title;
  final List<Meal> meals;

  void onSelectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal , toggleFavList: toggleFavList,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget con = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oopss.....",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "There is no meal present",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      con = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, indx) => MealItem(
          meal: meals[indx],
          onSelectMeal: (meal) {
            onSelectedMeal(context, meal);
          },
        ),
      );
    }
    if (title == null) {
      return con;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: con,
    );
  }
}
