
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class InfoProvider extends ChangeNotifier {
  final Stream<QuerySnapshot> bestStream = FirebaseFirestore.instance
      .collection('best')
      .orderBy('created_at')
      .snapshots();
  int ort = 1;
  void ortChanged() {
    ort++;
    notifyListeners();
  }

  void kamaytir() {
    if (ort < 2) {
      ort = 1;
      notifyListeners();
    } else {
      ort--;
      notifyListeners();
    }
  }
  
  // Variables
  List<Map<String, dynamic>> wishList = [];

  void addWishList(Map<String, dynamic> element) {
    if (wishList.contains(element)) {
      wishList.remove(element);
      notifyListeners();
    } else {
      wishList.add(element);
      notifyListeners();
    }
  }

}
