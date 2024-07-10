// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      firstName: json['FIRST_NAME'] as String,
      lastName: json['LAST_NAME'] as String,
      isActive: json['IS_ACTIVE'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'FIRST_NAME': instance.firstName,
      'LAST_NAME': instance.lastName,
      'IS_ACTIVE': instance.isActive,
    };
