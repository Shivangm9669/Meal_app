import 'package:flutter/material.dart';
import 'package:mealapp/data/categorydata.dart';
import 'package:mealapp/model/category.dart';
import 'package:mealapp/screens/mealscreen.dart';
import 'package:mealapp/widgets/catergorygriditem.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filteredlist = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: category.title, meals: filteredlist)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickup a Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories
            .map((category) => CategoryGridItem(
                  category: category,
                  onslected: () {
                    _selectedCategory(context, category);
                  },
                ))
            .toList(),
      ),
    );
  }
}
