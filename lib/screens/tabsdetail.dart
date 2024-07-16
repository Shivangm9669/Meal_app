import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealapp/provider/filterprovider.dart';
import 'package:mealapp/provider/favouritemealprovider.dart';
import 'package:mealapp/provider/mealprovider.dart';
import 'package:mealapp/screens/categoryscreen.dart';
import 'package:mealapp/screens/filterscreem.dart';
import 'package:mealapp/screens/mealscreen.dart';
import 'package:mealapp/widgets/appdrawer.dart';

var kInitalList = {
  Filters.glutenfree: false,
  Filters.lactosefree: false,
  Filters.vegan: false,
  Filters.vegetrain: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  void _selectedDrawerOption(String identifer) async {
    Navigator.of(context).pop();
    if (identifer == "filter") {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  int _selectedPageindx = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageindx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealprovided = ref.watch(mealProvider);
    final activeFilter = ref.watch(filterProvider);
    final availabelMeals = mealprovided.where((meal) {
      if (activeFilter[Filters.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filters.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilter[Filters.vegetrain]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilter[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = "Categories";
    Widget activePage = CategoryGrid(
      availableList: availabelMeals,
    );
    if (_selectedPageindx == 1) {
      final _favouriteMeals = ref.watch(favouriteMealProvider);
      activePage = MealScreen(
        meals: _favouriteMeals,
      );
      activePageTitle = "Favourite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: AppDrawer(
        selectedpage: _selectedDrawerOption,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageindx,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
