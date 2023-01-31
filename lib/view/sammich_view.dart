import 'package:flutter/material.dart';
import 'package:rsm/globals.dart';
import 'package:rsm/model/sammich.dart';

class SammichView extends StatefulWidget {
  Sammich sammich;
  SammichView({super.key, required this.sammich});

  @override
  State<SammichView> createState() => _SammichViewState();
}

class _SammichViewState extends State<SammichView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Sammich sammich = widget.sammich;
    List<Widget> ingredients = [
      Flexible(child: MyAssets.sauce),
      Flexible(child: MyAssets.veggies),
      Flexible(child: MyAssets.cheese),
      Flexible(child: MyAssets.protein),
    ];

    final infoWidget = FittedBox(
      fit: BoxFit.scaleDown,
      
      child: Text(
        sammich.toString(),
        maxLines: 3,
      ),
    );

    List<Widget> sammichWidget = (sammich.bread == 'Italian')
        ? [
            Flexible(child: MyAssets.topItalianBread),
            Flexible(
              child: Column(children: ingredients),
            ),
            Flexible(child: MyAssets.bottomItalianBread),
            Flexible(child: infoWidget),
          ]
        : [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.38,
                    child: Stack(
                      children: [
                        MyAssets.wrap,
                        Transform.scale(
                          scale: 0.44,
                          child: Column(children: ingredients),
                        ),
                      ],
                    ),
                  ),
                  infoWidget,
                ],
              ),
            ),
          ];

    return Center(
        child: Column(
      children: sammichWidget,
    ));
  }
}
