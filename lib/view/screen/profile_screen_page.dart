import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:organico/view/pages/favorite_page.dart';
import 'package:organico/view/pages/theme_mode_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notification_important_outlined,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 48, left: 20, right: 20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 85.5,
                          backgroundImage: NetworkImage(
                              "https://www.food-management.com/sites/food-management.com/files/GettyImages-589415708.jpg"),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text("Anzor", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Edit profile',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.445),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThemeModePage(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.file_copy_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Theme',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FavoritePage(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('My Wishlist',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.445),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('My Address',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.445),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Payment Method',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                  image: AssetImage("assets/quloqchin.png")),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Customer Service',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.lock_open_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Change Password',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Logout',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
            itemCount: 1,
          )),
    );
  }
}
