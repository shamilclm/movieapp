import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/features2/data/models/firebase_model.dart';

abstract class FirebaseserviseDatasource {
  Future<void> addtofirestore(Firebasemodel model);
  Future<void> deleteFromFirestore(int id);
  Stream<QuerySnapshot<Firebasemodel>> getfavoriteMovies();
}
