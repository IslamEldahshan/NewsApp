import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme =  ThemeData(
primarySwatch: Colors.deepOrange,
scaffoldBackgroundColor: Colors.white,
appBarTheme: const AppBarTheme(
backwardsCompatibility: false,
backgroundColor: Colors.white,
elevation: 0.0,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.white,
statusBarIconBrightness: Brightness.dark
),
titleTextStyle: TextStyle(
color: Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
iconTheme: IconThemeData(
color: Colors.black,
),
),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
elevation: 20.0,
backgroundColor: Colors.white,
selectedItemColor: Colors.deepOrange,
unselectedItemColor: Colors.grey,
),
textTheme: const TextTheme(
bodyText1: TextStyle(
fontSize: 18.0,
fontWeight: FontWeight.bold,
color: Colors.black,
),
),
);
ThemeData darkTheme = ThemeData(
primarySwatch: Colors.deepOrange,
scaffoldBackgroundColor: HexColor('333739'),
appBarTheme: AppBarTheme(
backwardsCompatibility: false,
backgroundColor: HexColor('333739'),
elevation: 0.0,
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: HexColor('333739'),
statusBarIconBrightness: Brightness.light,
),
titleTextStyle: const TextStyle(
color: Colors.white,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
iconTheme: const IconThemeData(
color: Colors.white,
),
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
elevation: 20.0,
backgroundColor: HexColor('333739'),
selectedItemColor: Colors.deepOrange,
unselectedItemColor: Colors.grey,
),
textTheme: const TextTheme(
bodyText1: TextStyle(
fontSize: 18.0,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
);