import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_entity.freezed.dart';

@freezed
class CommentEntity with _$CommentEntity {
  factory CommentEntity({required String comment, required String id}) =
      _CommentEntity;
}
