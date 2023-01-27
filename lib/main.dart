import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/logic/sammich_logic.dart';
import 'package:rsm/logic/shared_prefs.dart';
import 'package:rsm/model/filters.dart';
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
    Filters filters = Get.put(Filters(), permanent: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Sammich Maker',
      theme: ThemeData(
        backgroundColor: const Color(0xffE3D3C1),
        primaryColor: const Color(0xffEEBA3F),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: MyColors.primary),
            headline1: TextStyle(color: MyColors.primary)),
      ),
      home: Scaffold(
        backgroundColor: MyColors.lightShade,
        body: FutureBuilder<Filters>(
            future: SharedPrefsLogic.getFilters(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                debugPrint(snapshot.data?.numProtein.toString());
                //TODO: we now are able to save and read data
                // now to update the data,  create a getx Filter obj as ref for current filters
                // reference this getx filter when updating the filter with the new value to keep all the 
                // other values
                //SharedPrefsLogic.setFilters(Filters())
                return const HomeView();
              }
            }),
      ),
    );
  }
}
