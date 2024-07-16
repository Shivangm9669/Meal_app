import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mealapp/data/categorydata.dart";

final mealProvider = Provider((ref) {
  return dummyMeals;
});
