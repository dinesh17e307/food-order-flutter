import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { gluttenfree, lactosefree, vegetarian, vegan }

class FiltersProvider extends StateNotifier<Map<Filters, bool>> {
  FiltersProvider()
      : super({
          Filters.gluttenfree: false,
          Filters.lactosefree: false,
          Filters.vegan: false,
          Filters.vegetarian: false
        });

  void setActiveFilters(Filters filters, bool isActive) {
    state = {...state, filters: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FiltersProvider, Map<Filters, bool>>(
        (ref) => FiltersProvider());
