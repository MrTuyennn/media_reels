// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReelModel _$ReelModelFromJson(Map<String, dynamic> json) {
  return _ReelModel.fromJson(json);
}

/// @nodoc
mixin _$ReelModel {
  String get state => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;
  String get viewMode => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ReelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReelModelCopyWith<ReelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelModelCopyWith<$Res> {
  factory $ReelModelCopyWith(ReelModel value, $Res Function(ReelModel) then) =
      _$ReelModelCopyWithImpl<$Res, ReelModel>;
  @useResult
  $Res call({String state, String video, String viewMode, String imageUrl});
}

/// @nodoc
class _$ReelModelCopyWithImpl<$Res, $Val extends ReelModel>
    implements $ReelModelCopyWith<$Res> {
  _$ReelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? video = null,
    Object? viewMode = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReelModelImplCopyWith<$Res>
    implements $ReelModelCopyWith<$Res> {
  factory _$$ReelModelImplCopyWith(
          _$ReelModelImpl value, $Res Function(_$ReelModelImpl) then) =
      __$$ReelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String state, String video, String viewMode, String imageUrl});
}

/// @nodoc
class __$$ReelModelImplCopyWithImpl<$Res>
    extends _$ReelModelCopyWithImpl<$Res, _$ReelModelImpl>
    implements _$$ReelModelImplCopyWith<$Res> {
  __$$ReelModelImplCopyWithImpl(
      _$ReelModelImpl _value, $Res Function(_$ReelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? video = null,
    Object? viewMode = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ReelModelImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReelModelImpl implements _ReelModel {
  const _$ReelModelImpl(
      {this.state = '',
      this.video = '',
      this.viewMode = '',
      this.imageUrl = ''});

  factory _$ReelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReelModelImplFromJson(json);

  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String video;
  @override
  @JsonKey()
  final String viewMode;
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'ReelModel(state: $state, video: $video, viewMode: $viewMode, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelModelImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, state, video, viewMode, imageUrl);

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReelModelImplCopyWith<_$ReelModelImpl> get copyWith =>
      __$$ReelModelImplCopyWithImpl<_$ReelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReelModelImplToJson(
      this,
    );
  }
}

abstract class _ReelModel implements ReelModel {
  const factory _ReelModel(
      {final String state,
      final String video,
      final String viewMode,
      final String imageUrl}) = _$ReelModelImpl;

  factory _ReelModel.fromJson(Map<String, dynamic> json) =
      _$ReelModelImpl.fromJson;

  @override
  String get state;
  @override
  String get video;
  @override
  String get viewMode;
  @override
  String get imageUrl;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReelModelImplCopyWith<_$ReelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReponseReelModel _$ReponseReelModelFromJson(Map<String, dynamic> json) {
  return _ReponseReelModel.fromJson(json);
}

/// @nodoc
mixin _$ReponseReelModel {
  List<ReelModel> get lsReel => throw _privateConstructorUsedError;

  /// Serializes this ReponseReelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReponseReelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReponseReelModelCopyWith<ReponseReelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReponseReelModelCopyWith<$Res> {
  factory $ReponseReelModelCopyWith(
          ReponseReelModel value, $Res Function(ReponseReelModel) then) =
      _$ReponseReelModelCopyWithImpl<$Res, ReponseReelModel>;
  @useResult
  $Res call({List<ReelModel> lsReel});
}

/// @nodoc
class _$ReponseReelModelCopyWithImpl<$Res, $Val extends ReponseReelModel>
    implements $ReponseReelModelCopyWith<$Res> {
  _$ReponseReelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReponseReelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lsReel = null,
  }) {
    return _then(_value.copyWith(
      lsReel: null == lsReel
          ? _value.lsReel
          : lsReel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReponseReelModelImplCopyWith<$Res>
    implements $ReponseReelModelCopyWith<$Res> {
  factory _$$ReponseReelModelImplCopyWith(_$ReponseReelModelImpl value,
          $Res Function(_$ReponseReelModelImpl) then) =
      __$$ReponseReelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReelModel> lsReel});
}

/// @nodoc
class __$$ReponseReelModelImplCopyWithImpl<$Res>
    extends _$ReponseReelModelCopyWithImpl<$Res, _$ReponseReelModelImpl>
    implements _$$ReponseReelModelImplCopyWith<$Res> {
  __$$ReponseReelModelImplCopyWithImpl(_$ReponseReelModelImpl _value,
      $Res Function(_$ReponseReelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReponseReelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lsReel = null,
  }) {
    return _then(_$ReponseReelModelImpl(
      lsReel: null == lsReel
          ? _value._lsReel
          : lsReel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReponseReelModelImpl implements _ReponseReelModel {
  const _$ReponseReelModelImpl({final List<ReelModel> lsReel = const []})
      : _lsReel = lsReel;

  factory _$ReponseReelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReponseReelModelImplFromJson(json);

  final List<ReelModel> _lsReel;
  @override
  @JsonKey()
  List<ReelModel> get lsReel {
    if (_lsReel is EqualUnmodifiableListView) return _lsReel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsReel);
  }

  @override
  String toString() {
    return 'ReponseReelModel(lsReel: $lsReel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReponseReelModelImpl &&
            const DeepCollectionEquality().equals(other._lsReel, _lsReel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lsReel));

  /// Create a copy of ReponseReelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReponseReelModelImplCopyWith<_$ReponseReelModelImpl> get copyWith =>
      __$$ReponseReelModelImplCopyWithImpl<_$ReponseReelModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReponseReelModelImplToJson(
      this,
    );
  }
}

abstract class _ReponseReelModel implements ReponseReelModel {
  const factory _ReponseReelModel({final List<ReelModel> lsReel}) =
      _$ReponseReelModelImpl;

  factory _ReponseReelModel.fromJson(Map<String, dynamic> json) =
      _$ReponseReelModelImpl.fromJson;

  @override
  List<ReelModel> get lsReel;

  /// Create a copy of ReponseReelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReponseReelModelImplCopyWith<_$ReponseReelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
