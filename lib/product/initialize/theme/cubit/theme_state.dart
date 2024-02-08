part of 'theme_cubit.dart';

/// ThemeState
final class ThemeState extends Equatable {
  /// Constructor
  const ThemeState({this.themeMode = ThemeMode.system});

  /// fromMap
  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(themeMode: ThemeMode.values[map['themeMode'] as int]);
  }

  /// themeMode
  final ThemeMode themeMode;

  /// toMap
  Map<String, dynamic> toMap() {
    return {'themeMode': themeMode.index};
  }

  @override
  List<Object> get props => [themeMode];
}
