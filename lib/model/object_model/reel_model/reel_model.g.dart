// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReelModelImpl _$$ReelModelImplFromJson(Map<String, dynamic> json) =>
    _$ReelModelImpl(
      state: json['state'] as String? ?? '',
      video: json['video'] as String? ?? '',
      viewMode: json['viewMode'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$ReelModelImplToJson(_$ReelModelImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'video': instance.video,
      'viewMode': instance.viewMode,
      'imageUrl': instance.imageUrl,
    };

_$ReponseReelModelImpl _$$ReponseReelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReponseReelModelImpl(
      lsReel: (json['lsReel'] as List<dynamic>?)
              ?.map((e) => ReelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReponseReelModelImplToJson(
        _$ReponseReelModelImpl instance) =>
    <String, dynamic>{
      'lsReel': instance.lsReel,
    };
