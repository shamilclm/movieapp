import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_model.freezed.dart';
part 'firebase_model.g.dart';

@freezed
class Firebasemodel with _$Firebasemodel {
  const Firebasemodel._();
  const factory Firebasemodel(
      {required String originalTitle,
      required int id,
      required String overview,
      required String posterPath,
      required String title,
      required double voteAverage,
      required String backdropPath,
      required DateTime releaseDate,
      required String originalLanguage}) = _Firebasemodel;

  factory Firebasemodel.fromJson(Map<String, dynamic> json) =>
      _$FirebasemodelFromJson(json);

  factory Firebasemodel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Firebasemodel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
