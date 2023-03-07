import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:organico/provider/view/home/home_provider.dart';
import 'package:provider/provider.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Choost Category"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: context.read<HomeProvider>().categoryStream,
        builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          print(snapshot.data);
          if (snapshot.hasError) {
            return const Center(
              child: Text("Server error"),
            );
          } else if (!snapshot.hasData) {
            print(snapshot);
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
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Image.network(data[index]["img"]),
                        Text(data[index]["name"])
                      ],
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
