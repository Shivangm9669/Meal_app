import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/categoryscreen.dart';
import 'package:mealapp/screens/mealscreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> favList = [];

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteList(Meal meal) {
    final isExisiting = favList.contains(meal);
    if (isExisiting) {
      setState(() {
        favList.remove(meal);
        _showMessage("Meal Remove From Favourite");
      });
    } else {
      setState(() {
        favList.add(meal);
        _showMessage("Meal Added to Favourite");
      });
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
    var activePageTitle = "Categories";
    Widget activePage = CategoryGrid(
      toggleFavList: _toggleFavoriteList,
    );
    if (_selectedPageindx == 1) {
      activePage = MealScreen(
        meals: favList,
        toggleFavList: _toggleFavoriteList,
      );
      activePageTitle = "Favourite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
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
