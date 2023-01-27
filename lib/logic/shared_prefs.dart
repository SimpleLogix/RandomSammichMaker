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

  static updateFilters(String filter, String? subFilter, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    
  }

  static setFilters(Filters filters) async {
    final prefs = await SharedPreferences.getInstance();
    final stringFilters = jsonEncode(filters.toMap());
    prefs.setString("filters", stringFilters);
  }
}
