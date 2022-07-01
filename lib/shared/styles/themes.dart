import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData themeLight=ThemeData(
  bottomNavigationBarTheme:
  BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    backgroundColor:Colors.white,
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    iconTheme:IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle:TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight:FontWeight.bold,
    ) ,
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,

  ),
  textTheme:  const TextTheme(
    bodyText1:TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600,

    ),
      subtitle1:TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),

  ),
  fontFamily: "jannah",

);
ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor:HexColor("333739"),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor("333739"),
  ),
  primarySwatch: defaultColor,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20,
    iconTheme:IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle:TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight:FontWeight.bold,
    ) ,
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:HexColor("333739"),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor("333739"),
    elevation: 0,

  ),
  textTheme:  const TextTheme(
    bodyText1:TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    subtitle1:TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),

  ),
  fontFamily: "jannah",
  // primarySwatch: Colo
);