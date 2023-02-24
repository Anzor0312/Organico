import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organico/provider/auth/sign_in_provider.dart';
import 'package:organico/provider/auth/sign_up_provider.dart';
import 'package:organico/view/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => SignUpProvider(),),
    ChangeNotifierProvider(create: (context) => SingInProvider(),)
  ]));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScrenn(),
    );
  }
}