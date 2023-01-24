import 'package:flutter/material.dart';
import 'package:rsm/view/filters_view.dart';
import 'package:rsm/view/history_view.dart';
import 'package:rsm/view/sub_view.dart';

import '../globals.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isRefreshed = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: "Barrier",
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: const Duration(milliseconds: 200),
                        transitionBuilder: (ctx, a1, a2, child) {
                          var curve = Curves.easeInOut.transform(a1.value);
                          return Transform.scale(
                            scale: curve,
                            alignment: Alignment.topLeft,
                            origin: Offset(size.width * 1 / 4, 75),
                            child: AlertDialog(
                              backgroundColor: MyColors.bgGrey,
                              alignment: Alignment.bottomCenter,
                              insetPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              title: const Center(
                                child: Text(
                                  "Filters",
                                  style: TextStyle(color: MyColors.lightShade),
                                ),
                              ),
                              content: Container(
                                height: size.height * 2 / 3,
                                width: size.width,
                                child: const FiltersView(),
                              ),
                            ),
                          );
                        },
                        pageBuilder: (_, __, ___) {
                          return Container();
                        }); // showGeneralDialogue()
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
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
                        transitionDuration: const Duration(milliseconds: 200),
                        transitionBuilder: (ctx, a1, a2, child) {
                          var curve = Curves.easeInOut.transform(a1.value);
                          return Transform.scale(
                            scale: curve,
                            alignment: Alignment.topLeft,
                            origin: Offset(size.width * 3 / 4, 75),
                            child: AlertDialog(
                              backgroundColor: MyColors.bgGrey, 
                              alignment: Alignment.bottomCenter,
                              insetPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              title: const Center( 
                                child: Text(
                                  "History",
                                  style: TextStyle(color: MyColors.lightShade),
                                ),
                              ),
                              content: Container(
                                height: size.height * 2 / 3,
                                width: size.width,
                                child: const HistoryView(),
                              ),
                            ),
                          );
                        },
                        pageBuilder: (_, __, ___) {
                          return Container();
                        }); // showGeneralDialogue()
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    backgroundColor: MyColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("History"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: isRefreshed? MyColors.lightAccent : MyColors.primary,
              child: const SubView(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: IconButton(
              iconSize: 64,
              alignment: Alignment.center,
              onPressed: () {
                setState(() {
                  // TODO : yeah something here ...
                  isRefreshed = !isRefreshed;
                });
              },
              icon: Icon(
                Icons.refresh_outlined,
                color: isRefreshed? MyColors.lightAccent : MyColors.primary,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text("RSM v0.1"),
          )
        ],
      ),
    );
  }
}
