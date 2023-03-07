import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  final Stream<QuerySnapshot> categoryStream = FirebaseFirestore.instance
      .collection("products")
      .orderBy("created_at")
      .snapshots();
}
