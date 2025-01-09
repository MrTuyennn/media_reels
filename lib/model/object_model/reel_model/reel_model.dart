import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.g.dart';
part 'reel_model.freezed.dart';

@freezed
class ReelModel with _$ReelModel {
  const factory ReelModel({
    @Default('') String state,
    @Default('') String video,
    @Default('') String viewMode,
    @Default('') String imageUrl,
  }) = _ReelModel;

  factory ReelModel.fromJson(Map<String, Object?> json) =>
      _$ReelModelFromJson(json);
}

@freezed
class ReponseReelModel with _$ReponseReelModel {
  const factory ReponseReelModel({
    @Default([]) List<ReelModel> lsReel,
  }) = _ReponseReelModel;

  factory ReponseReelModel.fromJson(Map<String, Object?> json) =>
      _$ReponseReelModelFromJson(json);
}
