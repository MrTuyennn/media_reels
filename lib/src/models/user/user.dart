import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String firstName,
      required String lastName,
      @Default(false) bool isActive}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
