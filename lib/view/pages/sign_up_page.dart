import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/view/pages/sign_in_page.dart';
import 'package:provider/provider.dart';
import '../../provider/auth/sign_up_provider.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
  

    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      builder: (context, child) {
        return _scaffold(context);
      },
    );
  }

  Scaffold _scaffold(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Registration",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SignInPage(),
            //     ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
            double height = MediaQuery.of(context).size.height;
             double width = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 68, bottom: 48),
                  child: Text(
                      "It looks like you don’t have an account on this number. Please let us know some information for a secure service",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                 SizedBox(
                    width: width,
                    height: 22,
                    child:const Text("Full Name",
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: context.watch<SignUpProvider>().nameController,
                  
                  decoration: InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                ),
                const SizedBox(
                  height: 10,
                ),
               SizedBox(
                    width: width,
                    height: 22,
                    child:const Text("Email",
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: context.watch<SignUpProvider>().emailController,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.email_outlined),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                  ),
                ),
                 SizedBox(
                    width: width,
                    height: 22,
                    child:const Text("Password",
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller:
                      context.watch<SignUpProvider>().passwordController,
                  decoration: InputDecoration(
                      suffixIcon: const InkWell(
                          child: Icon(Icons.remove_red_eye_outlined)),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.crop_square_rounded,
                          size: 35,
                          color: Colors.grey,
                        )),
                     Text("I accept the",style: TextStyle(fontSize:width*0.027 ),),
                    TextButton(
                        onPressed: () {},
                        child:  Text(
                          "Terms of Use",
                          style: TextStyle(
                            color: Colors.green,fontSize:width*0.027 
                          ),
                        )),
                     Text("and",style: TextStyle(fontSize:width*0.027 ),),
                    TextButton(
                        onPressed: () {},
                        child:  Text(
                          " Privacy Policy",
                          style: TextStyle(color: Colors.green,fontSize:width*0.027),
                        )),
                  ],
                ),
               
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ));
                    },
                    child: const Text(" Sing In")),
                SizedBox(
                  width: 374,
                  height: 54,
                  child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffAA0023),
                      onPressed: () async {
                        await context
                            .read<SignUpProvider>()
                            .singUp()
                            .then((value) {
                          if (value == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          }
                        });
                      },
                      label: !context.watch<SignUpProvider>().isLoading
                          ? const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16),
                            )
                          : const CircularProgressIndicator.adaptive()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "or use",
                        style:
                            TextStyle(color: Color(0xff92929D), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage("assets/button.png"),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
