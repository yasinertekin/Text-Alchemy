import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:text_recognitions/product/core/constants/hive_constants.dart';

part 'result.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: HiveConstants.hiveTypeId)

/// Result model
final class Result with EquatableMixin {
  /// Result constructor
  Result({
    this.text,
    this.imagePath,
    String? id,
  }) : id = id ?? generateRandomId();

  /// Result from json
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  @HiveField(0)

  /// Text
  final String? text;
  @HiveField(1)

  /// Image path
  final String? imagePath;
  @HiveField(2)

  /// Id
  final String? id;

  /// To json
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  List<Object?> get props => [text, imagePath];

  /// Copy with
  Result copyWith({
    String? text,
    String? imagePath,
  }) {
    return Result(
      text: text ?? this.text,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  /// Generate random id
  static String generateRandomId({int length = 10}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }
}
