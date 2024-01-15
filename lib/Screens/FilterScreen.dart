import 'package:flutter/material.dart';
import 'package:foodorder/Providers/filters_provider.dart';
import 'package:foodorder/Screens/MainDrawer.dart';
import 'package:foodorder/Screens/Tabs_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.selectedFilters});
  final Map<Filters, bool> selectedFilters;
  State<FilterScreen> createState() {
    return _StateFilterScreen();
  }
}

class _StateFilterScreen extends State<FilterScreen> {
  var _gluttenfreeproducts = false;
  var _lactosefreeproducts = false;
  var _vegetarianproducts = false;
  var _veganproducts = false;
  void _setFilterDetails(bool isChecked) {
    setState(() {
      _gluttenfreeproducts = isChecked;
    });
  }

  @override
  void initState() {
    super.initState();
    _gluttenfreeproducts = widget.selectedFilters[Filters.gluttenfree]!;
    _lactosefreeproducts = widget.selectedFilters[Filters.lactosefree]!;
    _vegetarianproducts = widget.selectedFilters[Filters.vegetarian]!;
    _veganproducts = widget.selectedFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(
        //   selectScreen: (identifier) {
        //     if (identifier == 'meals') {
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (ctx) => const TabScreen()));
        //     }
        //   },
        // ),
        body: WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pop({
                Filters.gluttenfree: _gluttenfreeproducts,
                Filters.lactosefree: _lactosefreeproducts,
                Filters.vegan: _veganproducts,
                Filters.vegetarian: _vegetarianproducts
              });
              return false;
            },
            child: Column(
              children: [
                SwitchListTile(
                    value: _gluttenfreeproducts,
                    onChanged: (isChecked) {
                      setState(() {
                        _gluttenfreeproducts = isChecked;
                      });
                    },
                    title: Text(
                      'Gluten Free',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    subtitle: Text(
                      'Only glutten free products includes',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
                SwitchListTile(
                    value: _lactosefreeproducts,
                    onChanged: (isChecked) {
                      setState(() {
                        _lactosefreeproducts = isChecked;
                      });
                    },
                    title: Text(
                      'Lactose Free',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    subtitle: Text(
                      'Only lactose free products includes',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
                SwitchListTile(
                    value: _vegetarianproducts,
                    onChanged: (isChecked) {
                      setState(() {
                        _vegetarianproducts = isChecked;
                      });
                    },
                    title: Text(
                      'Vegetarian',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    subtitle: Text(
                      'Only Vegetarian meals are included',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
                SwitchListTile(
                    value: _veganproducts,
                    onChanged: (isChecked) {
                      setState(() {
                        _veganproducts = isChecked;
                      });
                    },
                    title: Text(
                      'Vegan',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    subtitle: Text(
                      'Only Vegan meals are included',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary),
                    )),
              ],
            )));
  }
}
