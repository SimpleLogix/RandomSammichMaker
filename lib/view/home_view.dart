import 'package:flutter/material.dart';
import 'package:rsm/logic/sammich_logic.dart';
import 'package:rsm/model/filters.dart';
import 'package:rsm/model/sammich.dart';
import 'package:rsm/view/filters_view.dart';
import 'package:rsm/view/saved_view.dart';
import 'package:rsm/view/sub_view.dart';

import '../globals.dart';
import '../logic/shared_prefs.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String version = "RSM v0.8";
  bool isRefreshed = false;
  late Sammich rngSammich;
  late Filters filters;
  late List<String> saved;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: FutureBuilder(
          future: SharedPrefsLogic.getPrefsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              filters = Filters.fromJson(snapshot.data!['filters']);
              saved = snapshot.data!['saved'];
              // get a random sanwhich with the filters
              rngSammich = SammichLogic.rngSammich(filters);
              return Stack(
                fit: StackFit.loose,
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Container(
                                        color: MyColors.bgGrey,
                                        height: size.height * 0.85,
                                        width: size.width,
                                        child: FiltersView(filters: filters),
                                      );
                                    }).whenComplete(() {
                                  //SharedPrefsLogic.setFilters(filters)
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                backgroundColor: MyColors.lightAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Filters"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    barrierLabel: "Barrier",
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    transitionBuilder: (ctx, a1, a2, child) {
                                      var curve =
                                          Curves.easeInOut.transform(a1.value);
                                      return Transform.scale(
                                        scale: curve,
                                        alignment: Alignment.topLeft,
                                        origin: Offset(size.width * 3 / 4, 75),
                                        child: AlertDialog(
                                          backgroundColor: MyColors.bgGrey,
                                          alignment: Alignment.bottomCenter,
                                          insetPadding: EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          title: const Center(
                                            child: Text(
                                              "Saved",
                                              style: TextStyle(
                                                  color: MyColors.lightShade),
                                            ),
                                          ),
                                          content: Container(
                                            height: size.height * 2 / 3,
                                            width: size.width,
                                            child: SavedView(saved: saved),
                                          ),
                                        ),
                                      );
                                    },
                                    pageBuilder: (_, __, ___) {
                                      return Container();
                                    }); // showGeneralDialogue()
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                backgroundColor: MyColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Saved"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: isRefreshed
                              ? MyColors.lightAccent
                              : MyColors.primary,
                          child: SubView(sammich: rngSammich, saved: saved),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: MyColors.lightShade, shape: BoxShape.circle),
                      child: IconButton(
                        iconSize: 56,
                        alignment: Alignment.center,
                        onPressed: () {
                          setState(() {
                            isRefreshed = !isRefreshed;
                            rngSammich = SammichLogic.rngSammich(filters);
                          });
                        },
                        icon: const Icon(
                          Icons.refresh_outlined,
                          color: MyColors.bgGrey,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(version),
                  ),
                ],
              );
            }
          }),
    );
  }
}
