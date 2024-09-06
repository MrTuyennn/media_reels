import 'package:equatable/equatable.dart';

enum ThemeModeLM { light, dark }

class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeModeLM.light});

  final ThemeModeLM themeMode;

  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeModeLM? newThemeMode,
  }) =>
      ThemeState(themeMode: newThemeMode ?? themeMode);
}
