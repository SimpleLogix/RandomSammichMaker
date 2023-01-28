import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/logic/shared_prefs.dart';
import 'package:rsm/model/sammich.dart';

class SubView extends StatefulWidget {
  Sammich sammich;
  List<String> saved;
  SubView({super.key, required this.sammich, required this.saved});

  @override
  State<SubView> createState() => _SubViewState();
}

class _SubViewState extends State<SubView> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    debugPrint(isSaved.toString());
    final sammichText =
        "${widget.sammich.bread}\n${widget.sammich.cheese}\n${widget.sammich.veggies.join(' - ')}\n${widget.sammich.protein.join(' - ')}\n${widget.sammich.sauces.join(' - ')}\n${widget.sammich.toppings.join(' - ')}";
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sammichText),
          IconButton(
              onPressed: () {
                setState(() {
                  if (isSaved) {
                    SharedPrefsLogic.removeLastSaved();
                    widget.saved.remove(widget.sammich.toString());
                  } else {
                    SharedPrefsLogic.addToSaved(widget.sammich.toString());
                    widget.saved.add(widget.sammich.toString());
                  }
                  isSaved = !isSaved;
                });
              },
              iconSize: 48,
              icon: Icon(
                isSaved ? Icons.star : Icons.star_border,
                color: Colors.amber[600],
              )),
          TextButton(
            child: Text("Clear"),
            onPressed: () async {
              isSaved = false;
              widget.saved.clear();
              SharedPrefsLogic.clear();
            },
          ),
        ],
      ),
    );
  }
}
