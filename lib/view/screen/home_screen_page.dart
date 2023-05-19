import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/provider/view/info_provider.dart';
import 'package:organico/view/pages/Info_page.dart';
import 'package:organico/view/pages/categoyr_page.dart';
import 'package:organico/view/pages/chooseCategory_page.dart';
import 'package:provider/provider.dart';
import '../../provider/view/home/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35),
                child: Text(
                  "Your Location",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bandung, Cimahi",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_down_outlined))
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search anything here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Image(
                            image: AssetImage("assets/union.png"),
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      const Column(
                        children: [
                          Text(
                            "You have 0 coupon",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Let’s use this coupon",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff696974),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16,
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          color: Color(0xff696974))
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Choose Category"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChooseCategory(),
                            ));
                      },
                      child: const Text("See all"))
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: context.read<HomeProvider>().categoryStream,
                builder:
                    (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Server error"),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Map<String, dynamic>> data = [];
                    snapshot.data!.docs.map((document) {
                      data.add(document.data() as Map<String, dynamic>);
                    }).toList();
                    if (data.isEmpty) {
                      return const Center(
                        child: Text("Hali ma'lumot kelmadi"),
                      );
                    } else {
                      return SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: InkWell(
                                onTap: () {
                                  Stream<QuerySnapshot> stream = FirebaseFirestore
                                      .instance
                                      .collection(
                                          'products/${data[index]['name']}/${data[index]['name']}')
                                      .orderBy('created_at')
                                      .snapshots();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CategoryPage(
                                            stream: stream,
                                            namecategory: data[index]["name"]),
                                      ));
                                },
                                child: Container(
                                  width: 123,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffEAF0F6),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(data[index]["img"]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(data[index]["name"])
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: data.length,
                        ),
                      );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Best Selling"),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              const Expanded(flex: 5, child: BestSelling())
            ],
          ),
        ),
      ),
    );
  }
}

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: context.read<InfoProvider>().bestStream,
          builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("SERVER ERROR"),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Map<String, dynamic>> data = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                data.add(document.data() as Map<String, dynamic>);
              }).toList();

              if (data.isEmpty) {
                return const Center(
                  child: Text(" QO'SHILMAGAN"),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: 196,
                        height: 242,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      data[index]['img'],
                                    ),
                                  ),
                                ],
                              ),
                              Text(data[index]['name']),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${data[index]["price"]}/Kg"),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  InfoPage(data: data[index]),
                                            ));
                                      },
                                      child: const Image(
                                          image: AssetImage("assets/add.png")))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                );
              }
            }
          }),
    );
  }
}

