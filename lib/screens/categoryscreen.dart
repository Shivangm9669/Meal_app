import 'package:flutter/material.dart';

import 'package:mealapp/data/categorydata.dart';
import 'package:mealapp/model/category.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/mealscreen.dart';
import 'package:mealapp/widgets/catergorygriditem.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key, required this.availableList});
  final List<Meal> availableList;

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationsController;

  @override
  void initState() {
    super.initState();
    _animationsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationsController.forward();
  }

  @override
  void dispose() {
    _animationsController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredlist = widget.availableList
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealScreen(
              title: category.title,
              meals: filteredlist,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationsController,
      child: GridView(
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
      builder: (context, child) => SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, 0.3), end: const Offset(0, 0))
                .animate(
          CurvedAnimation(
              parent: _animationsController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
