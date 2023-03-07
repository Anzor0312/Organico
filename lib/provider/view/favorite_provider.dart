import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:organico/data/service/favorite_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final Stream<QuerySnapshot> favoriteStream = FirebaseFirestore.instance
      .collection('favorite')
      .orderBy('created_at')
      .snapshots();

  void writeFavorite({required String name,required String img}) async {
    await FavoriteService.writeFavorite(name: name,img: img);
  }
}
