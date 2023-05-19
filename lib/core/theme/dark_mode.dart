import 'package:flutter/material.dart';

class ClickDarkThemeMode {
  static ThemeData theme = ThemeData(
 textTheme:const TextTheme(
bodyLarge: TextStyle(color: Color.fromARGB(255, 218, 213, 213),backgroundColor:Colors.white )
 ) ,
    scaffoldBackgroundColor:const Color(0xff171725),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff171725),
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),

    ),  
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
     backgroundColor: Color(0xff1D2335),
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(color: Color(0xff696974)),
        selectedLabelStyle: TextStyle(color:Colors.black54,fontStyle: FontStyle.normal ),
  
    ),
    iconTheme: const IconThemeData(color: Color(0xff1D2335))
  );
}
