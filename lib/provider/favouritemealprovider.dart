import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/model/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  bool togglefavourite(Meal meal) {
    final isfavouriteMeal = state.contains(meal);

    if (isfavouriteMeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
        (ref) => FavouriteMealNotifier());
