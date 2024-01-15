import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/Providers/Meals_provider.dart';
import 'package:foodorder/Providers/favourite_provider.dart';
import 'package:foodorder/Providers/filters_provider.dart';
import 'package:foodorder/Screens/Categories.dart';
import 'package:foodorder/Screens/FilterScreen.dart';
import 'package:foodorder/Screens/MainDrawer.dart';
import 'package:foodorder/Screens/MealsScreen.dart';

import 'package:foodorder/dataModel/meal.dart';

const kIntialFilter = {
  Filters.gluttenfree: false,
  Filters.lactosefree: false,
  Filters.vegan: false,
  Filters.vegetarian: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _StatetabScreen();
  }
}

class _StatetabScreen extends ConsumerState<TabScreen> {
  int _currentIndex = 0;

  Map<Filters, bool> _selectedFilters = kIntialFilter;
  String activePageTitle = 'Categories';
  void _setpage(int index) {
    setState(() {
      _currentIndex = index;
    });
    print(index);
  }

  void _showInfoMessage(String message) {}

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(
              builder: (ctx) =>
                  FilterScreen(selectedFilters: _selectedFilters)));
      setState(() {
        _selectedFilters = result ?? kIntialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dummyMeals = ref.watch(mealsProvider);
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.gluttenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget _activePage = CategoriesScreen(availableMeals: availableMeals);
    if (_currentIndex == 1) {
      final favouriteMeals = ref.watch(favouriteProvider);
      _activePage = MealsScreen(meals: favouriteMeals);
      activePageTitle = 'Your Favourites';
    }
    if (_currentIndex == 0) {
      _activePage = CategoriesScreen(availableMeals: availableMeals);
      activePageTitle = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(selectScreen: _setScreen),
      body: _activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourites'),
        ],
      ),
    );
  }
}
