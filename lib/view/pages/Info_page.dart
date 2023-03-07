import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organico/provider/view/favorite_provider.dart';
import 'package:organico/provider/view/info_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InfoPage extends StatelessWidget {
  Map<String, dynamic> data = {};
  InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InfoProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<FavoriteProvider>().writeFavorite(name: data['name'], img: data['img']);
                  },
                  icon: const Icon(Icons.favorite_border_outlined))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(
                      height: 210,
                      width: 238,
                      child: Image.network(
                        data['img'].toString(),
                        fit: BoxFit.contain,
                      )),
                ),
                Text(
                  data['name'].toString(),
                  style: const TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<InfoProvider>().kamaytir();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Icon(Icons.remove)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(context.watch<InfoProvider>().ort.toString(),
                          style: const TextStyle(fontSize: 24)),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<InfoProvider>().ortChanged();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset("assets/dolar.png")),
                    Text(
                      "${(double.parse(data['price'])) * context.watch<InfoProvider>().ort}/Kg",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
