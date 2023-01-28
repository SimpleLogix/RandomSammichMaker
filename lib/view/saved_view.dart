import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/logic/shared_prefs.dart';

class SavedView extends StatefulWidget {
  List<String> saved;

  SavedView({super.key, required this.saved});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.saved.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: const Icon(
              Icons.list,
              color: MyColors.lightShade,
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  SharedPrefsLogic.removeSavedIndex(index);
                  widget.saved.removeAt(index);
                });
              },
              icon: const Icon(
                Icons.star,
                fill: 1,
                color: MyColors.primary,
              ),
            ),
            title: Text(
              widget.saved[index],
              style: const TextStyle(color: MyColors.lightShade, fontSize: 12),
            ));
      },
    );
  }
}
