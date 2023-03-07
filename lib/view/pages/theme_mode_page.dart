import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Theme Mode"),
      ),
      body: Column(
        children: [
           ElevatedButton(
              onPressed: () {
                AdaptiveTheme.of(context).setDark();
              },
              child:const Text("Theme DarkMode")),
          ElevatedButton(onPressed: () {
                AdaptiveTheme.of(context).setLight();

          }, child:const Text("Theme LightMode")),
        ],
      ),
    );
  }
}