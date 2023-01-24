import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key});

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Filters view", style: TextStyle(color: MyColors.lightShade),),
    );
  }
}