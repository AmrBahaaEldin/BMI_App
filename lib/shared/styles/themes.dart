 import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';





ThemeData darkTheme=ThemeData(
    primarySwatch:defaultColor ,


    scaffoldBackgroundColor: HexColor('333739'),
    textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 16,color: Colors.white )),
    appBarTheme:  AppBarTheme(

      elevation: 0.0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),




      titleTextStyle: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedIconTheme: IconThemeData(color: Colors.white),
    )
);


ThemeData lightTheme=ThemeData(
    primarySwatch:defaultColor ,
    scaffoldBackgroundColor: Colors.white,
    textTheme:  TextTheme(bodyLarge: TextStyle(fontSize: 16.0,color:Colors.black  ) ),

    appBarTheme: AppBarTheme(

      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),

      titleTextStyle: TextStyle(color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedIconTheme: IconThemeData(color: Colors.black),
    )
);