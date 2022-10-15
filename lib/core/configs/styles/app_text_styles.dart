import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Raleway';

  static const TextStyle bodyLg = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySm = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle bodyXs = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle h1 = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}
