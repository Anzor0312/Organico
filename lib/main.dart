
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organico/provider/auth/sign_in_provider.dart';
import 'package:organico/provider/auth/sign_up_provider.dart';
import 'package:organico/provider/view/favorite_provider.dart';
import 'package:organico/provider/view/home/home_provider.dart';
import 'package:organico/provider/view/info_provider.dart';
import 'package:organico/view/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'core/router/router.dart';
import 'core/theme/dark_mode.dart';
import 'core/theme/light_mode.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create:   (context) => SingInProvider(), ),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => InfoProvider(),),
        ChangeNotifierProvider(create: (context) => FavoriteProvider(),),



        
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ClickLightThemeMode.theme,
      dark: ClickDarkThemeMode.theme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          theme:theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScrenn(),
          onGenerateRoute: RouteGenerator.router.onGenerate,
          initialRoute: "/",
        );
      },
    );
  }
}
