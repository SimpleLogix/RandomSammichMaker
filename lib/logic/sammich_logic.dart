import 'package:rsm/model/filters.dart';
import 'package:rsm/model/sammich.dart';
import 'dart:math';

class SammichLogic {
  //
  /// create a random sammich based on the given filters
  static Sammich rngSammich(Filters filter) {
    var rng = new Random();

    // choosing bread
    List<String> breads = filter.selectedBread!.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    String bread =
        breads[rng.nextInt(breads.length)]; //TODO: give these 'weights'

    // choosing protein
    List<String> proteins = [];
    filter.selectedProtein!.forEach((key, value) {
      if (value) {
        proteins.add(key);
      }
    });
    proteins.shuffle();
    if (filter.numProtein < proteins.length) {
     proteins = proteins.sublist(0, filter.numProtein);
    }

    // choosing cheese
    List<String> cheeses = filter.selectedCheese!.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    String cheese = cheeses[rng.nextInt(cheeses.length)];

    // choosing veggies
    List<String> veggies = filter.selectedVeggies!.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    veggies.shuffle();
    if (filter.numVeggies < veggies.length) {
      veggies = veggies.sublist(0, filter.numVeggies);
    }

    // choosing sauces
    List<String> sauces = filter.selectedSauce!.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    sauces.shuffle();
    if (filter.numSauce < sauces.length) {
      sauces = sauces.sublist(0, filter.numSauce);
    }

    // choosing sauces
    List<String> toppings = filter.selectedToppings!.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    toppings.shuffle();
    if (filter.numToppings < toppings.length) {
      toppings = toppings.sublist(0, filter.numToppings);
    }

    // create a random sammich:
    Sammich rngSammich = Sammich(
        bread: bread,
        cheese: cheese,
        veggies: veggies,
        protein: proteins,
        sauces: sauces,
        toppings: toppings);
    return rngSammich;
  }


}
