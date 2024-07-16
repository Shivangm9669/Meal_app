import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { glutenfree, vegan, vegetrain, lactosefree }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosefree: false,
          Filters.vegan: false,
          Filters.vegetrain: false,
        });

  void setFilters(Map<Filters, bool> selectedFilter) {
    state = selectedFilter;
  }

  void setFilter(Filters filter, bool isactive) {
    state = {...state, filter: isactive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref) {
  return FilterNotifier();
});
