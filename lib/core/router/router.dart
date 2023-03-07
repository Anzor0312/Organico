
import 'package:flutter/material.dart';
import 'package:organico/view/pages/home_page.dart';
import 'package:organico/view/pages/sign_in_page.dart';
import 'package:organico/view/pages/sign_up_page.dart';


class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;

  RouteGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "home":
        return _navigator(const HomePage());
      case "signIn":
        return _navigator(const SignInPage());
      case "signUp":
        return _navigator(const SignUpPage());
    }
    return null;
  }

  MaterialPageRoute _navigator(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
