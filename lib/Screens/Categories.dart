import 'package:flutter/material.dart';
import 'package:foodorder/Screens/MealsScreen.dart';
import 'package:foodorder/Widgets/Category_grid_item.dart';
import 'package:foodorder/data/dummy_data.dart';
import 'package:foodorder/dataModel/Category.dart';
import 'package:foodorder/dataModel/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;
  void _onSelectedItem(BuildContext context, Category category) {
    final filteredLists = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredLists,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedcategory: () {
                _onSelectedItem(context, category);
              },
            )
        ]);
  }
}
