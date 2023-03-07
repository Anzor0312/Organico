import 'package:flutter/material.dart';

class ClickLightThemeMode {
  static ThemeData theme = ThemeData(
    drawerTheme:const DrawerThemeData(
      backgroundColor: Colors.white
    ) ,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black)
    )
  );
}
