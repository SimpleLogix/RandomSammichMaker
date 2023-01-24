import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color(0xffE3D3C1),
        primaryColor: const Color(0xffEEBA3F),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: MyColors.primary),
          headline1: TextStyle(color: MyColors.primary)
        ),
      ),
      home: const Scaffold(
        backgroundColor: MyColors.lightShade,
        body: HomeView(),
      ),
    );
  }
}
