import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'trailer_model.freezed.dart';
part 'trailer_model.g.dart';

Movievedios movievediosFromJson(String str) =>
    Movievedios.fromJson(json.decode(str));

String movievediosToJson(Movievedios data) => json.encode(data.toJson());

@freezed
class Movievedios with _$Movievedios {
  const factory Movievedios({
    required int id,
    required List<Result> results,
  }) = _Movievedios;

  factory Movievedios.fromJson(Map<String, dynamic> json) =>
      _$MovievediosFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required String? iso6391,
    required String? iso31661,
    required String? name,
    required String? key,
    required String? site,
    required int? size,
    required String? type,
    required bool? official,
    required DateTime? publishedAt,
    required String? id,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
