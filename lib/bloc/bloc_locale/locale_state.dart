part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({
    @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
    @Default(AppConfig.defaultLanguage)
    Locale locale,
  }) = _LocaleState;

  factory LocaleState.fromJson(Map<String, dynamic> json) =>
      _$LocaleStateFromJson(json);
}

// Helper functions to convert Locale to/from JSON
Locale _localeFromJson(String localeString) {
  final split = localeString.split('_');
  return Locale(split[0], split.length > 1 ? split[1] : null);
}

String _localeToJson(Locale locale) {
  return locale.countryCode != null
      ? '${locale.languageCode}_${locale.countryCode}'
      : locale.languageCode;
}
