import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/features2/data/datasource/comment_datasource.dart';
import 'package:movieapp/features2/data/models/comment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'comment_datasource_impl.g.dart';

class CommentDatasourceImpl extends CommentDatasource {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addComment(CommentModel model, String id) async {
    await db
        .collection(id)
        .withConverter(
            fromFirestore: CommentModel.fromFirestore,
            toFirestore: (CommentModel model, _) => model.toFirestore())
        .doc()
        .set(model);
  }

  @override
  Stream<QuerySnapshot<CommentModel>> getcomment(String id) {
    return db
        .collection(id)
        .withConverter(
            fromFirestore: CommentModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore())
        .snapshots();
  }
}

@riverpod
CommentDatasource commentDataSource(CommentDataSourceRef ref) {
  return CommentDatasourceImpl();
}
