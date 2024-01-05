// To parse this JSON data, do
//
//     final confessionModel = confessionModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confession_model.freezed.dart';
part 'confession_model.g.dart';

ConfessionModel confessionModelFromJson(String str) =>
    ConfessionModel.fromJson(json.decode(str) as Map<String, dynamic>);

String confessionModelToJson(ConfessionModel data) => json.encode(data.toJson());

DateTime _sendAtFromJson(Timestamp timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

@freezed
class ConfessionModel with _$ConfessionModel {
  const factory ConfessionModel({
    required String confession,
    required String name,
    // createdAt as timestamp
    @JsonKey(name: 'createdAt', fromJson: _sendAtFromJson) required DateTime createdAt,
    required int likes,
    required int gender,
    required int age,
    required String email,
  }) = _ConfessionModel;

  factory ConfessionModel.fromJson(Map<String, dynamic> json) => _$ConfessionModelFromJson(json);
}
