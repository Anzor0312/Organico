import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/view/pages/Info_page.dart';

class CategoryPage extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final String namecategory;
  const CategoryPage(
      {super.key, required this.stream, required this.namecategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namecategory),
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
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
                child: Text("Bu kategoriya bo'sh"),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 234,
                      width: 176,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              height: 79,
                              width: 96,
                              child: Image.network(data[index]["img"])),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(data[index]["name"].toString()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/dollar.png",)),
                              Text("${data[index]["price"].toString()}/Kg"),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InfoPage(
                                            // ignore: unnecessary_cast
                                            data: (data[index]
                                                as Map<String, dynamic>)),
                                      ));
                                },
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(child: Icon(Icons.add)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              );
            }
          }
        },
      ),
    );
  }
}
