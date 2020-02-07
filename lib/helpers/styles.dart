import 'package:flutter/material.dart';

class Styles {
  static Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5],
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFf9f5f2),
    ],
  );
  static Gradient pizzaPalateBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5],
    colors: [
      Color(0xFFfbf9f7),
      Color(0xFFfffef9),
    ],
  );
  static List<BoxShadow> pizzaPalateShadow = [
    BoxShadow(
      offset: Offset(0, 45.0),
      blurRadius: 99,
      spreadRadius: -50,
      color: Color(0x4D522a21),
    ),
  ];
  static List<BoxShadow> addToCartaButtonShadow = [
    BoxShadow(
      color: Color(0xFFfe8c00),
      offset: Offset(0, 11),
      blurRadius: 11,
      spreadRadius: -5,
    ),
  ];

  static Gradient addToCartButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFf6d06b),
      Color(0xFFf75e39),
    ],
  );
}
