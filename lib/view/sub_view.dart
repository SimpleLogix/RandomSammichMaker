import 'package:flutter/material.dart';
import 'package:rsm/model/sammich.dart';

class SubView extends StatefulWidget {
  Sammich sammich;

  SubView({super.key, required this.sammich});

  @override
  State<SubView> createState() => _SubViewState();
}

class _SubViewState extends State<SubView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          "${widget.sammich.bread}\n\n${widget.sammich.cheese}\n\n${widget.sammich.veggies.join(' - ')}\n\n${widget.sammich.protein.join(' - ')}\n\n${widget.sammich.sauces.join(' - ')}\n\n${widget.sammich.toppings.join(' - ')}"),
    );
  }
}
