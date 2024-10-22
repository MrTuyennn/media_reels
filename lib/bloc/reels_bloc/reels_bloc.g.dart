// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReelsStateImpl _$$ReelsStateImplFromJson(Map<String, dynamic> json) =>
    _$ReelsStateImpl(
      controllerVideo: const VideoPlayerControllerConverter()
          .fromJson(json['controllerVideo'] as String?),
    );

Map<String, dynamic> _$$ReelsStateImplToJson(_$ReelsStateImpl instance) =>
    <String, dynamic>{
      'controllerVideo': const VideoPlayerControllerConverter()
          .toJson(instance.controllerVideo),
    };
