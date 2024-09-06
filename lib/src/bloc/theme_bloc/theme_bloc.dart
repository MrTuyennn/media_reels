import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_event.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ChangeThemeMode>(_changeThemeMode);
  }

  void _changeThemeMode(ChangeThemeMode event, Emitter emit) {
    emit(state.copyWith(newThemeMode: event.themeMode));
  }
}
