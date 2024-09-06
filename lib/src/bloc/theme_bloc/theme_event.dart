import 'package:equatable/equatable.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_state.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeThemeMode extends ThemeEvent {
  final ThemeModeLM themeMode;
  ChangeThemeMode({required this.themeMode});
}
