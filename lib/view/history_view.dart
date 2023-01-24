import 'package:flutter/material.dart';

import '../globals.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("history view",  style: TextStyle(color: MyColors.lightShade),),
    );
  }
}