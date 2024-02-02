import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/features2/data/models/comment_model.dart';

abstract class CommentDatasource {
  Future<void> addComment(CommentModel model, String id);
  Stream<QuerySnapshot<CommentModel>> getcomment(String id);
}
