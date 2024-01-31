import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/features2/data/datasource/firebase_datasource.dart';
import 'package:movieapp/features2/data/models/firebase_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasource_impl.g.dart';

class FirebaseserviceDatasourceImpl extends FirebaseserviseDatasource {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('Favourite_movies').withConverter(
      fromFirestore: Firebasemodel.fromFirestore,
      toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addtofirestore(Firebasemodel model) async {
    await collection.doc(model.id.toString()).set(model);
  }

  @override
  Future<void> deleteFromFirestore(int id) async {
    await firestore.collection('Favourite_movies').doc(id.toString()).delete();
  }

  @override
  Stream<QuerySnapshot<Firebasemodel>> getfavoriteMovies() {
    return collection.snapshots();
  }
}

@riverpod
FirebaseserviseDatasource firebaseDatasource(FirebaseDatasourceRef ref) {
  return FirebaseserviceDatasourceImpl();
}
