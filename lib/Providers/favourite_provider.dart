import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/dataModel/meal.dart';

class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider() : super([]);
  // way of initial the values

  bool toggleFavouritMeals(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((item) => item.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteMealsProvider, List<Meal>>((ref) {
  return FavouriteMealsProvider();
});
