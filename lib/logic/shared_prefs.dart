import 'package:flutter/material.dart';
import 'package:rsm/model/filters.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsLogic {
  /// checks if user launched app previously and
  /// sets default filter for new users
  /// returns existing one for current/saved users
  static Future<Filters> getFilters() async {
    final prefs = await SharedPreferences.getInstance();
    final hasFilters = prefs.getBool("userHasFilters");
    if (hasFilters != null) {
      final encodedFilters = prefs.getString("filters")!;
      Map<String, dynamic> fs = jsonDecode(encodedFilters);
      fs['selectedBread'] = (fs['selectedBread']).cast<String, bool>();
      fs['selectedProtein'] = (fs['selectedProtein']).cast<String, bool>();
      fs['selectedCheese'] = (fs['selectedCheese']).cast<String, bool>();
      fs['selectedVeggies'] = (fs['selectedVeggies']).cast<String, bool>();
      fs['selectedSauce'] = (fs['selectedSauce']).cast<String, bool>();
      fs['selectedToppings'] = (fs['selectedToppings']).cast<String, bool>();
      Filters filters = Filters.fromJson(fs);
      return filters;
    } else {
      // encode the default filter
      final encodedFilter = jsonEncode(Filters().toMap());
      prefs.setString("filters", encodedFilter);
      prefs.setBool("userHasFilters", true);
      return Filters();
    }
  }

  static setFilters(Filters filters) async {
    final prefs = await SharedPreferences.getInstance();
    final stringFilters = jsonEncode(filters.toMap());
    prefs.setString("filters", stringFilters);
  }

  static Future<List<String>> getSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final hasHistory = prefs.getBool("userHasSaved");
    if (hasHistory != null) {
      final saved = prefs.getStringList("saved")!;
      return saved;
    } else {
      return [];
    }
  }

  static addToSaved(String value) async {
    final prefs = await SharedPreferences.getInstance();
    final hasHistory = prefs.getBool("userHasSaved");
    if (hasHistory != null) {
      var saved = prefs.getStringList("saved")!;
      saved.add(value);
      prefs.setStringList("saved", saved);
    } else {
      prefs.setStringList("saved", [value]);
      prefs.setBool("userHasSaved", true);
    }
  }

  static Future<Map<String, dynamic>> getPrefsData() async {
    Filters filters = await getFilters();
    List<String> saved = await getSaved();
    return {
      'filters': filters.toMap(),
      'saved': saved,
    };
  }

  static removeSavedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    var saved = prefs.getStringList("saved");
    saved!.removeAt(index);
    prefs.setStringList("saved", saved);
  }

  static removeLastSaved() async {
    final prefs = await SharedPreferences.getInstance();
    var saved = prefs.getStringList("saved");
    saved!.removeLast();
    prefs.setStringList("saved", saved);
  }

  static clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("saved");
    prefs.remove("userHasSaved");
  }
}
