import 'package:flutter/material.dart';

/// Colors
class MyColors {
  //
  static const lightShade = Color(0xffF5EDE3);
  static const lightAccent = Color(0xff8CA3A0);
  static const primary = Color(0xffA9A761);
  static const darkAccent = Color(0xffA16F40);
  static const darkShade = Color(0xff473D3A);

  static const bgGrey = Color(0xff272B30);
}

/// assets for displaying subs
class MyAssets {
  //* BREAD ASSETS

  static final Widget topItalianBread =
      Image.asset('assets/images/italian_bread.png');
  static final Widget bottomItalianBread = Transform.rotate(
    angle: 135,
    child: Transform.scale(
      scaleX: -1,
      child: Image.asset('assets/images/italian_bread.png'),
    ),
  );

  static final Widget wrap = Image.asset('assets/images/wrap.png');

  //* PROTEIN ASSETS
  static final Widget chickenStrips =
      Image.asset('assets/images/protein/chicken_strips.png');
  static final Widget chickenTeriyaki =
      Image.asset('assets/images/protein/chicken_teriyaki.png');
  static final Widget chickenBuffalo =
      Image.asset('assets/images/protein/chicken_buffalo.png');
  static final Widget chickenRotisserie =
      Image.asset('assets/images/protein/chicken_rotissary.png');

  static final Widget veggies = Image.asset('assets/images/veggies.png');
  static final Widget sauce = Image.asset('assets/images/sauce.png');
  static final Widget cheese = Image.asset('assets/images/cheese.png');
  static final Widget protein = Image.asset('assets/images/protein.png');
}
