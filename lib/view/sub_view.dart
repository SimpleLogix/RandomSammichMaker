import 'package:flutter/material.dart';

class SubView extends StatefulWidget {
  const SubView({super.key});

  @override
  State<SubView> createState() => _SubViewState();
}

class _SubViewState extends State<SubView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Sub View"),
    );
  }
}