import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Sammich Maker',
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: const Color(0xffE3D3C1),
        primaryColor: const Color(0xffEEBA3F),
      ),
      home: const Scaffold(
        backgroundColor: MyColors.lightShade,
        body: HomeView()
      ),
    );
  }
}
