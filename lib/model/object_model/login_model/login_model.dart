import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.g.dart';
part 'login_model.freezed.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @Default("") String userName,
    @Default("") String passWord,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);
}
