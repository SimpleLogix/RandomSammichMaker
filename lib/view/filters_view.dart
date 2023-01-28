import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/logic/shared_prefs.dart';
import 'package:rsm/model/filters.dart';

class FiltersView extends StatefulWidget {
  Filters filters;

  FiltersView({super.key, required this.filters});

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  @override
  Widget build(BuildContext context) {
    Filters filters = widget.filters;
    // wrap to expand the height dynamically
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //* BREADS FILTERS
        const Text(
          "Breads",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedBread.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 13)),
                selected: filters.selectedBread[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedBread[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),
        const Divider(indent: 60, endIndent: 60),
        //* Protein FILTERS
        const Text(
          "Protein",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedProtein.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 12)),
                selected: filters.selectedProtein[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedProtein[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),
        Slider(
          value: filters.numProtein.toDouble(),
          max: 10,
          divisions: 10,
          onChanged: (double value) {
            setState(() {
              filters.numProtein = value.toInt();
              SharedPrefsLogic.setFilters(filters);
            });
          },
        ),

        const Divider(indent: 60, endIndent: 60),

        //* CHEESE FILTERS
        const Text(
          "Cheese",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedCheese.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 12)),
                selected: filters.selectedCheese[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedCheese[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),

        const Divider(indent: 60, endIndent: 60),

        //* VEGGIE FILTERS
        const Text(
          "Veggies",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedVeggies.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 12)),
                selected: filters.selectedVeggies[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedVeggies[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),
        Slider(
          value: filters.numVeggies.toDouble(),
          max: 10,
          divisions: 10,
          onChanged: (double value) {
            setState(() {
              filters.numVeggies = value.toInt();
              SharedPrefsLogic.setFilters(filters);
            });
          },
        ),
        const Divider(indent: 60, endIndent: 60),

        //* SAUCE FILTERS
        const Text(
          "Sauces",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedSauce.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 12)),
                selected: filters.selectedSauce[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedSauce[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),
        Slider(
          value: filters.numSauce.toDouble(),
          max: 11,
          divisions: 11,
          onChanged: (double value) {
            setState(() {
              filters.numSauce = value.toInt();
              SharedPrefsLogic.setFilters(filters);
            });
          },
        ),

        const Divider(indent: 60, endIndent: 60),

        //* TOPPINGS FILTERS
        const Text(
          "Toppings",
          style: TextStyle(color: MyColors.lightShade),
        ),
        Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: filters.selectedToppings.keys.map((String filter) {
              return FilterChip(
                label: Text(filter, style: const TextStyle(fontSize: 12)),
                selected: filters.selectedToppings[filter]!,
                onSelected: (bool value) {
                  setState(() {
                    filters.selectedToppings[filter] = value;
                    SharedPrefsLogic.setFilters(filters);
                  });
                },
              );
            }).toList()),
        Slider(
          value: filters.numToppings.toDouble(),
          max: 5,
          divisions: 5,
          onChanged: (double value) {
            setState(() {
              filters.numToppings = value.toInt();
              SharedPrefsLogic.setFilters(filters);
            });
          },
        ),
      ]),
    ));
  }
}
