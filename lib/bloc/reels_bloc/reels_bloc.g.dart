// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReelsStateImpl _$$ReelsStateImplFromJson(Map<String, dynamic> json) =>
    _$ReelsStateImpl(
      lsReel: (json['lsReel'] as List<dynamic>?)
              ?.map((e) => ReelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentVideo: (json['currentVideo'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReelsStateImplToJson(_$ReelsStateImpl instance) =>
    <String, dynamic>{
      'lsReel': instance.lsReel,
      'currentVideo': instance.currentVideo,
    };
