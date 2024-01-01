// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black)),
    primarySwatch: Colors.lightBlue,
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
    iconTheme: IconThemeData(
      color: Colors.amber,
    ),
    inputDecorationTheme: InputDecorationTheme(),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.amber),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    cardTheme: CardTheme(
        color: Colors.white,
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5.0))));
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff333739),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 47, 139, 39),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white)),
    primarySwatch: Colors.lightBlue,
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
    iconTheme: IconThemeData(
      color: Colors.amber,
    ),
    inputDecorationTheme: InputDecorationTheme(),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
        color: Color(0xff333739),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5.0))));
