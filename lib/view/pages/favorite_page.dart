import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/provider/view/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("My Wishlist"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: context.read<FavoriteProvider>().favoriteStream,
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
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      
                      child: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(data[index]['img'],fit: BoxFit.fill),
                                Container(
                                  width: 36,
                                  height: 36,
                                   decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                        ),
                                  child:const Center(
                                    child: Icon(Icons.favorite_border_outlined),
                                  ),
                                )
                              ],
                            ),
                            Text(data[index]['name']),
                           const Text("1 Kilogram")
                          ],
                        ),
                      ),
                    );
                  },itemCount: data.length,
                );
              }
            }
          }),
    );
  }
}
