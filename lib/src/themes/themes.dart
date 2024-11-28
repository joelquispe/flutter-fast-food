import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData.light().copyWith(
    highlightColor: black,
    primaryColor: primaryColor,
    primaryTextTheme: TextTheme(bodyMedium: TextStyle(color: black)),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
          bodyColor: black,
        ),
  );
}

ThemeData themeDark(BuildContext context) {
  return ThemeData.light().copyWith(
    highlightColor: black,
    primaryColor: primaryColor,
    primaryTextTheme: TextTheme(bodyMedium: TextStyle(color: black)),
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
          bodyColor: black,
        ),
  );
}
