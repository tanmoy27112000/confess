// To parse this JSON data, do
//
//     final tagModel = tagModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

TagModel tagModelFromJson(String str) => TagModel.fromJson(json.decode(str) as Map<String, dynamic>);

String tagModelToJson(TagModel data) => json.encode(data.toJson());

@freezed
class TagModel with _$TagModel {
  const factory TagModel({
    required String id,
    required String tagName,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);
}
