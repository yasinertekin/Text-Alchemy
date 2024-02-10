import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

/// DrawerModel is a model class for the drawer items.
final class DrawerModel with EquatableMixin {
  /// DrawerModel is a model class for the drawer items.
  DrawerModel({
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  /// Title of the drawer item.
  final String title;

  /// Trailing widget of the drawer item.
  final Widget trailing;

  /// OnTap function of the drawer item.
  final void Function() onTap;

  @override
  List<Object?> get props => [title, trailing, onTap];
}
