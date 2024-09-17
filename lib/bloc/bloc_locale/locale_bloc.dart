import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_reels/l10n/l10n.dart';

part 'locale_bloc.freezed.dart';
part 'locale_bloc.g.dart';
part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState()) {
    on<_SwithLocale>(_switchLocale);
  }

  _switchLocale(_SwithLocale event, Emitter emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
