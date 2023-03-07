import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organico/helpers/show_message_widget.dart';

class FavoriteService {
  static CollectionReference favoriteCollection =
      FirebaseFirestore.instance.collection("favorite");

  static Future<void> writeFavorite({required name,required img}) async {
    try {
      
      favoriteCollection.add({
        "name": name,
        "created_at": FieldValue.serverTimestamp(),
        'img':img
      });
    } on FirebaseException catch (e) {
      showErrorMessage(e.message.toString());
    }
  }
}
