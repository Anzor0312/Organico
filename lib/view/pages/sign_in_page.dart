import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth/sign_in_provider.dart';
import 'home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingInProvider(),
      builder: (context, child) {
        return _scaffold(context);
      },
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
     return   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
                  padding:const EdgeInsets.only(left: 20),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                  width: 349,
                  height: 318,
                    child:const Image(image: AssetImage("assets/welkom.png"),fit: BoxFit.fill,)),
                ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 69),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Welcome to Organico Mobile Apps.Please fill in the field below to sign in.",style: TextStyle(fontSize: 16)
                  ),
                 
                ],
              ),
            ),
          const  SizedBox(height: 32,),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      controller:
                          context.watch<SingInProvider>().emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller:
                          context.watch<SingInProvider>().passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: SizedBox(
        width: 374,
        height: 54,
        child: FloatingActionButton.extended(
            backgroundColor:const Color(0xffAA0023),
            onPressed: () async {
                await context.read<SingInProvider>().singIn().then((value) {
                  if (value == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const HomePage(),
                        ));
                  }
                });
            },
            label: !context.watch<SingInProvider>().isLoading
                  ? const Text("Sign In")
                  : const CircularProgressIndicator.adaptive()),
      ),
              ),
            
          ],
        );
      },itemCount: 1,),

    );
  }
}
