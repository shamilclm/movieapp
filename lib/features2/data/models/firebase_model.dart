// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// @freezed
// class Firebasemodel with _$Firebasemodel {
//   const Firebasemodel._();
//   const factory Firebasemodel(
    
//       {required String originalTitle,
//       required int id,
//       required String overview,
//       required String posterPath,
//       required String title,
//       required double voteAverage,
//       required String backdropPath,
//       required DateTime releaseDate,
//       required String originalLanguage}) = _Firebasemodel;


//   factory Firebasemodel.fromFirebase(
//     DocumentSnapshot<Map<String,dynamic>>snapshot,
//     SnapshotOptions? options,
//   ){
//    final data=snapshot.data()!;
//     return Firebasemodel(originalTitle: originalTitle, id: id, overview: overview, posterPath: posterPath, title: title, voteAverage: voteAverage, backdropPath: backdropPath, releaseDate: releaseDate, originalLanguage: originalLanguage)
//   }

// }
