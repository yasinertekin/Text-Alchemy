import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: 0)
final class Result with EquatableMixin {
  Result({
    this.text,
    this.imagePath,
    String? id,
  }) : id = id ?? generateRandomId();

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  @HiveField(0)
  final String? text;
  @HiveField(1)
  final String? imagePath;
  @HiveField(2)
  final String? id;

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  List<Object?> get props => [text, imagePath];

  Result copyWith({
    String? text,
    String? imagePath,
  }) {
    return Result(
      text: text ?? this.text,
      imagePath: imagePath ?? this.imagePath,
    );
  }

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
