// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reels_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReelsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) initReels,
    required TResult Function() disposeReels,
    required TResult Function() getListMultiReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? initReels,
    TResult? Function()? disposeReels,
    TResult? Function()? getListMultiReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? initReels,
    TResult Function()? disposeReels,
    TResult Function()? getListMultiReels,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitReels value) initReels,
    required TResult Function(_DisposeReels value) disposeReels,
    required TResult Function(_GetListMultiReels value) getListMultiReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitReels value)? initReels,
    TResult? Function(_DisposeReels value)? disposeReels,
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitReels value)? initReels,
    TResult Function(_DisposeReels value)? disposeReels,
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsEventCopyWith<$Res> {
  factory $ReelsEventCopyWith(
          ReelsEvent value, $Res Function(ReelsEvent) then) =
      _$ReelsEventCopyWithImpl<$Res, ReelsEvent>;
}

/// @nodoc
class _$ReelsEventCopyWithImpl<$Res, $Val extends ReelsEvent>
    implements $ReelsEventCopyWith<$Res> {
  _$ReelsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitReelsImplCopyWith<$Res> {
  factory _$$InitReelsImplCopyWith(
          _$InitReelsImpl value, $Res Function(_$InitReelsImpl) then) =
      __$$InitReelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$InitReelsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$InitReelsImpl>
    implements _$$InitReelsImplCopyWith<$Res> {
  __$$InitReelsImplCopyWithImpl(
      _$InitReelsImpl _value, $Res Function(_$InitReelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$InitReelsImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitReelsImpl implements _InitReels {
  const _$InitReelsImpl(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'ReelsEvent.initReels(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitReelsImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitReelsImplCopyWith<_$InitReelsImpl> get copyWith =>
      __$$InitReelsImplCopyWithImpl<_$InitReelsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) initReels,
    required TResult Function() disposeReels,
    required TResult Function() getListMultiReels,
  }) {
    return initReels(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? initReels,
    TResult? Function()? disposeReels,
    TResult? Function()? getListMultiReels,
  }) {
    return initReels?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? initReels,
    TResult Function()? disposeReels,
    TResult Function()? getListMultiReels,
    required TResult orElse(),
  }) {
    if (initReels != null) {
      return initReels(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitReels value) initReels,
    required TResult Function(_DisposeReels value) disposeReels,
    required TResult Function(_GetListMultiReels value) getListMultiReels,
  }) {
    return initReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitReels value)? initReels,
    TResult? Function(_DisposeReels value)? disposeReels,
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
  }) {
    return initReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitReels value)? initReels,
    TResult Function(_DisposeReels value)? disposeReels,
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    required TResult orElse(),
  }) {
    if (initReels != null) {
      return initReels(this);
    }
    return orElse();
  }
}

abstract class _InitReels implements ReelsEvent {
  const factory _InitReels(final String url) = _$InitReelsImpl;

  String get url;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitReelsImplCopyWith<_$InitReelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisposeReelsImplCopyWith<$Res> {
  factory _$$DisposeReelsImplCopyWith(
          _$DisposeReelsImpl value, $Res Function(_$DisposeReelsImpl) then) =
      __$$DisposeReelsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeReelsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$DisposeReelsImpl>
    implements _$$DisposeReelsImplCopyWith<$Res> {
  __$$DisposeReelsImplCopyWithImpl(
      _$DisposeReelsImpl _value, $Res Function(_$DisposeReelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisposeReelsImpl implements _DisposeReels {
  const _$DisposeReelsImpl();

  @override
  String toString() {
    return 'ReelsEvent.disposeReels()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeReelsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) initReels,
    required TResult Function() disposeReels,
    required TResult Function() getListMultiReels,
  }) {
    return disposeReels();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? initReels,
    TResult? Function()? disposeReels,
    TResult? Function()? getListMultiReels,
  }) {
    return disposeReels?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? initReels,
    TResult Function()? disposeReels,
    TResult Function()? getListMultiReels,
    required TResult orElse(),
  }) {
    if (disposeReels != null) {
      return disposeReels();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitReels value) initReels,
    required TResult Function(_DisposeReels value) disposeReels,
    required TResult Function(_GetListMultiReels value) getListMultiReels,
  }) {
    return disposeReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitReels value)? initReels,
    TResult? Function(_DisposeReels value)? disposeReels,
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
  }) {
    return disposeReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitReels value)? initReels,
    TResult Function(_DisposeReels value)? disposeReels,
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    required TResult orElse(),
  }) {
    if (disposeReels != null) {
      return disposeReels(this);
    }
    return orElse();
  }
}

abstract class _DisposeReels implements ReelsEvent {
  const factory _DisposeReels() = _$DisposeReelsImpl;
}

/// @nodoc
abstract class _$$GetListMultiReelsImplCopyWith<$Res> {
  factory _$$GetListMultiReelsImplCopyWith(_$GetListMultiReelsImpl value,
          $Res Function(_$GetListMultiReelsImpl) then) =
      __$$GetListMultiReelsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetListMultiReelsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$GetListMultiReelsImpl>
    implements _$$GetListMultiReelsImplCopyWith<$Res> {
  __$$GetListMultiReelsImplCopyWithImpl(_$GetListMultiReelsImpl _value,
      $Res Function(_$GetListMultiReelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetListMultiReelsImpl implements _GetListMultiReels {
  const _$GetListMultiReelsImpl();

  @override
  String toString() {
    return 'ReelsEvent.getListMultiReels()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetListMultiReelsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) initReels,
    required TResult Function() disposeReels,
    required TResult Function() getListMultiReels,
  }) {
    return getListMultiReels();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? initReels,
    TResult? Function()? disposeReels,
    TResult? Function()? getListMultiReels,
  }) {
    return getListMultiReels?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? initReels,
    TResult Function()? disposeReels,
    TResult Function()? getListMultiReels,
    required TResult orElse(),
  }) {
    if (getListMultiReels != null) {
      return getListMultiReels();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitReels value) initReels,
    required TResult Function(_DisposeReels value) disposeReels,
    required TResult Function(_GetListMultiReels value) getListMultiReels,
  }) {
    return getListMultiReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitReels value)? initReels,
    TResult? Function(_DisposeReels value)? disposeReels,
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
  }) {
    return getListMultiReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitReels value)? initReels,
    TResult Function(_DisposeReels value)? disposeReels,
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    required TResult orElse(),
  }) {
    if (getListMultiReels != null) {
      return getListMultiReels(this);
    }
    return orElse();
  }
}

abstract class _GetListMultiReels implements ReelsEvent {
  const factory _GetListMultiReels() = _$GetListMultiReelsImpl;
}

ReelsState _$ReelsStateFromJson(Map<String, dynamic> json) {
  return _ReelsState.fromJson(json);
}

/// @nodoc
mixin _$ReelsState {
  @VideoPlayerControllerConverter()
  VideoPlayerController? get controllerVideo =>
      throw _privateConstructorUsedError;

  /// Serializes this ReelsState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReelsStateCopyWith<ReelsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsStateCopyWith<$Res> {
  factory $ReelsStateCopyWith(
          ReelsState value, $Res Function(ReelsState) then) =
      _$ReelsStateCopyWithImpl<$Res, ReelsState>;
  @useResult
  $Res call(
      {@VideoPlayerControllerConverter()
      VideoPlayerController? controllerVideo});
}

/// @nodoc
class _$ReelsStateCopyWithImpl<$Res, $Val extends ReelsState>
    implements $ReelsStateCopyWith<$Res> {
  _$ReelsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllerVideo = freezed,
  }) {
    return _then(_value.copyWith(
      controllerVideo: freezed == controllerVideo
          ? _value.controllerVideo
          : controllerVideo // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReelsStateImplCopyWith<$Res>
    implements $ReelsStateCopyWith<$Res> {
  factory _$$ReelsStateImplCopyWith(
          _$ReelsStateImpl value, $Res Function(_$ReelsStateImpl) then) =
      __$$ReelsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@VideoPlayerControllerConverter()
      VideoPlayerController? controllerVideo});
}

/// @nodoc
class __$$ReelsStateImplCopyWithImpl<$Res>
    extends _$ReelsStateCopyWithImpl<$Res, _$ReelsStateImpl>
    implements _$$ReelsStateImplCopyWith<$Res> {
  __$$ReelsStateImplCopyWithImpl(
      _$ReelsStateImpl _value, $Res Function(_$ReelsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllerVideo = freezed,
  }) {
    return _then(_$ReelsStateImpl(
      controllerVideo: freezed == controllerVideo
          ? _value.controllerVideo
          : controllerVideo // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReelsStateImpl implements _ReelsState {
  _$ReelsStateImpl({@VideoPlayerControllerConverter() this.controllerVideo});

  factory _$ReelsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReelsStateImplFromJson(json);

  @override
  @VideoPlayerControllerConverter()
  final VideoPlayerController? controllerVideo;

  @override
  String toString() {
    return 'ReelsState(controllerVideo: $controllerVideo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelsStateImpl &&
            (identical(other.controllerVideo, controllerVideo) ||
                other.controllerVideo == controllerVideo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, controllerVideo);

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReelsStateImplCopyWith<_$ReelsStateImpl> get copyWith =>
      __$$ReelsStateImplCopyWithImpl<_$ReelsStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReelsStateImplToJson(
      this,
    );
  }
}

abstract class _ReelsState implements ReelsState {
  factory _ReelsState(
      {@VideoPlayerControllerConverter()
      final VideoPlayerController? controllerVideo}) = _$ReelsStateImpl;

  factory _ReelsState.fromJson(Map<String, dynamic> json) =
      _$ReelsStateImpl.fromJson;

  @override
  @VideoPlayerControllerConverter()
  VideoPlayerController? get controllerVideo;

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReelsStateImplCopyWith<_$ReelsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
