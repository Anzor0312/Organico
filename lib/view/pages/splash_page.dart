
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'sign_up_page.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {chekUser()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          
          Image(image: AssetImage("assets/Logo.png")),
          SizedBox(height: 20,),
          Text("Organico",style: TextStyle(fontSize: 24),)
        ],
      )),
    );
  }

  void chekUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ));
      }
    });
  }
}
