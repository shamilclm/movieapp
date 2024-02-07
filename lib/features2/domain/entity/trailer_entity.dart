import 'package:freezed_annotation/freezed_annotation.dart';
part 'trailer_entity.freezed.dart';

@freezed
class Trailerentity with _$Trailerentity {
  factory Trailerentity({
    required String type,
    required String name,
    required String key,
  }) = _Trailerentity;
}
