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
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
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
abstract class _$$GetListMultiReelsImplCopyWith<$Res> {
  factory _$$GetListMultiReelsImplCopyWith(_$GetListMultiReelsImpl value,
          $Res Function(_$GetListMultiReelsImpl) then) =
      __$$GetListMultiReelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReelModel> lsReel});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lsReel = null,
  }) {
    return _then(_$GetListMultiReelsImpl(
      null == lsReel
          ? _value._lsReel
          : lsReel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
    ));
  }
}

/// @nodoc

class _$GetListMultiReelsImpl implements _GetListMultiReels {
  const _$GetListMultiReelsImpl(final List<ReelModel> lsReel)
      : _lsReel = lsReel;

  final List<ReelModel> _lsReel;
  @override
  List<ReelModel> get lsReel {
    if (_lsReel is EqualUnmodifiableListView) return _lsReel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lsReel);
  }

  @override
  String toString() {
    return 'ReelsEvent.getListMultiReels(lsReel: $lsReel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListMultiReelsImpl &&
            const DeepCollectionEquality().equals(other._lsReel, _lsReel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lsReel));

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListMultiReelsImplCopyWith<_$GetListMultiReelsImpl> get copyWith =>
      __$$GetListMultiReelsImplCopyWithImpl<_$GetListMultiReelsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return getListMultiReels(lsReel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return getListMultiReels?.call(lsReel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (getListMultiReels != null) {
      return getListMultiReels(lsReel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return getListMultiReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return getListMultiReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (getListMultiReels != null) {
      return getListMultiReels(this);
    }
    return orElse();
  }
}

abstract class _GetListMultiReels implements ReelsEvent {
  const factory _GetListMultiReels(final List<ReelModel> lsReel) =
      _$GetListMultiReelsImpl;

  List<ReelModel> get lsReel;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetListMultiReelsImplCopyWith<_$GetListMultiReelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeReelImplCopyWith<$Res> {
  factory _$$OnChangeReelImplCopyWith(
          _$OnChangeReelImpl value, $Res Function(_$OnChangeReelImpl) then) =
      __$$OnChangeReelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$OnChangeReelImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$OnChangeReelImpl>
    implements _$$OnChangeReelImplCopyWith<$Res> {
  __$$OnChangeReelImplCopyWithImpl(
      _$OnChangeReelImpl _value, $Res Function(_$OnChangeReelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$OnChangeReelImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnChangeReelImpl implements _OnChangeReel {
  const _$OnChangeReelImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ReelsEvent.onChangeReel(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeReelImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeReelImplCopyWith<_$OnChangeReelImpl> get copyWith =>
      __$$OnChangeReelImplCopyWithImpl<_$OnChangeReelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return onChangeReel(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return onChangeReel?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (onChangeReel != null) {
      return onChangeReel(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return onChangeReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return onChangeReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (onChangeReel != null) {
      return onChangeReel(this);
    }
    return orElse();
  }
}

abstract class _OnChangeReel implements ReelsEvent {
  const factory _OnChangeReel(final int index) = _$OnChangeReelImpl;

  int get index;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeReelImplCopyWith<_$OnChangeReelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitVideoImplCopyWith<$Res> {
  factory _$$InitVideoImplCopyWith(
          _$InitVideoImpl value, $Res Function(_$InitVideoImpl) then) =
      __$$InitVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$InitVideoImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$InitVideoImpl>
    implements _$$InitVideoImplCopyWith<$Res> {
  __$$InitVideoImplCopyWithImpl(
      _$InitVideoImpl _value, $Res Function(_$InitVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$InitVideoImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitVideoImpl implements _InitVideo {
  const _$InitVideoImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ReelsEvent.initVideo(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitVideoImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitVideoImplCopyWith<_$InitVideoImpl> get copyWith =>
      __$$InitVideoImplCopyWithImpl<_$InitVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return initVideo(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return initVideo?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (initVideo != null) {
      return initVideo(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return initVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return initVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (initVideo != null) {
      return initVideo(this);
    }
    return orElse();
  }
}

abstract class _InitVideo implements ReelsEvent {
  const factory _InitVideo(final int index) = _$InitVideoImpl;

  int get index;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitVideoImplCopyWith<_$InitVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayVideoImplCopyWith<$Res> {
  factory _$$PlayVideoImplCopyWith(
          _$PlayVideoImpl value, $Res Function(_$PlayVideoImpl) then) =
      __$$PlayVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PlayVideoImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$PlayVideoImpl>
    implements _$$PlayVideoImplCopyWith<$Res> {
  __$$PlayVideoImplCopyWithImpl(
      _$PlayVideoImpl _value, $Res Function(_$PlayVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PlayVideoImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PlayVideoImpl implements _PlayVideo {
  const _$PlayVideoImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ReelsEvent.playVideo(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayVideoImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayVideoImplCopyWith<_$PlayVideoImpl> get copyWith =>
      __$$PlayVideoImplCopyWithImpl<_$PlayVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return playVideo(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return playVideo?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (playVideo != null) {
      return playVideo(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return playVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return playVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (playVideo != null) {
      return playVideo(this);
    }
    return orElse();
  }
}

abstract class _PlayVideo implements ReelsEvent {
  const factory _PlayVideo(final int index) = _$PlayVideoImpl;

  int get index;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayVideoImplCopyWith<_$PlayVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseVideoImplCopyWith<$Res> {
  factory _$$PauseVideoImplCopyWith(
          _$PauseVideoImpl value, $Res Function(_$PauseVideoImpl) then) =
      __$$PauseVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PauseVideoImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$PauseVideoImpl>
    implements _$$PauseVideoImplCopyWith<$Res> {
  __$$PauseVideoImplCopyWithImpl(
      _$PauseVideoImpl _value, $Res Function(_$PauseVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PauseVideoImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PauseVideoImpl implements _PauseVideo {
  const _$PauseVideoImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ReelsEvent.pauseVideo(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseVideoImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseVideoImplCopyWith<_$PauseVideoImpl> get copyWith =>
      __$$PauseVideoImplCopyWithImpl<_$PauseVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return pauseVideo(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return pauseVideo?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (pauseVideo != null) {
      return pauseVideo(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return pauseVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return pauseVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (pauseVideo != null) {
      return pauseVideo(this);
    }
    return orElse();
  }
}

abstract class _PauseVideo implements ReelsEvent {
  const factory _PauseVideo(final int index) = _$PauseVideoImpl;

  int get index;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PauseVideoImplCopyWith<_$PauseVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisposeVideoImplCopyWith<$Res> {
  factory _$$DisposeVideoImplCopyWith(
          _$DisposeVideoImpl value, $Res Function(_$DisposeVideoImpl) then) =
      __$$DisposeVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DisposeVideoImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$DisposeVideoImpl>
    implements _$$DisposeVideoImplCopyWith<$Res> {
  __$$DisposeVideoImplCopyWithImpl(
      _$DisposeVideoImpl _value, $Res Function(_$DisposeVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DisposeVideoImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DisposeVideoImpl implements _DisposeVideo {
  const _$DisposeVideoImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ReelsEvent.disposeVideo(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisposeVideoImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisposeVideoImplCopyWith<_$DisposeVideoImpl> get copyWith =>
      __$$DisposeVideoImplCopyWithImpl<_$DisposeVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> lsReel) getListMultiReels,
    required TResult Function(int index) onChangeReel,
    required TResult Function(int index) initVideo,
    required TResult Function(int index) playVideo,
    required TResult Function(int index) pauseVideo,
    required TResult Function(int index) disposeVideo,
  }) {
    return disposeVideo(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult? Function(int index)? onChangeReel,
    TResult? Function(int index)? initVideo,
    TResult? Function(int index)? playVideo,
    TResult? Function(int index)? pauseVideo,
    TResult? Function(int index)? disposeVideo,
  }) {
    return disposeVideo?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> lsReel)? getListMultiReels,
    TResult Function(int index)? onChangeReel,
    TResult Function(int index)? initVideo,
    TResult Function(int index)? playVideo,
    TResult Function(int index)? pauseVideo,
    TResult Function(int index)? disposeVideo,
    required TResult orElse(),
  }) {
    if (disposeVideo != null) {
      return disposeVideo(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetListMultiReels value) getListMultiReels,
    required TResult Function(_OnChangeReel value) onChangeReel,
    required TResult Function(_InitVideo value) initVideo,
    required TResult Function(_PlayVideo value) playVideo,
    required TResult Function(_PauseVideo value) pauseVideo,
    required TResult Function(_DisposeVideo value) disposeVideo,
  }) {
    return disposeVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetListMultiReels value)? getListMultiReels,
    TResult? Function(_OnChangeReel value)? onChangeReel,
    TResult? Function(_InitVideo value)? initVideo,
    TResult? Function(_PlayVideo value)? playVideo,
    TResult? Function(_PauseVideo value)? pauseVideo,
    TResult? Function(_DisposeVideo value)? disposeVideo,
  }) {
    return disposeVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetListMultiReels value)? getListMultiReels,
    TResult Function(_OnChangeReel value)? onChangeReel,
    TResult Function(_InitVideo value)? initVideo,
    TResult Function(_PlayVideo value)? playVideo,
    TResult Function(_PauseVideo value)? pauseVideo,
    TResult Function(_DisposeVideo value)? disposeVideo,
    required TResult orElse(),
  }) {
    if (disposeVideo != null) {
      return disposeVideo(this);
    }
    return orElse();
  }
}

abstract class _DisposeVideo implements ReelsEvent {
  const factory _DisposeVideo(final int index) = _$DisposeVideoImpl;

  int get index;

  /// Create a copy of ReelsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisposeVideoImplCopyWith<_$DisposeVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReelsState _$ReelsStateFromJson(Map<String, dynamic> json) {
  return _ReelsState.fromJson(json);
}

/// @nodoc
mixin _$ReelsState {
  @JsonKey(ignore: true)
  PageController? get pageControllerMedia => throw _privateConstructorUsedError;
  List<ReelModel> get lsReel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<int, AVController>? get videoController =>
      throw _privateConstructorUsedError;
  int get currentVideo => throw _privateConstructorUsedError;

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
      {@JsonKey(ignore: true) PageController? pageControllerMedia,
      List<ReelModel> lsReel,
      @JsonKey(ignore: true) Map<int, AVController>? videoController,
      int currentVideo});
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
    Object? pageControllerMedia = freezed,
    Object? lsReel = null,
    Object? videoController = freezed,
    Object? currentVideo = null,
  }) {
    return _then(_value.copyWith(
      pageControllerMedia: freezed == pageControllerMedia
          ? _value.pageControllerMedia
          : pageControllerMedia // ignore: cast_nullable_to_non_nullable
              as PageController?,
      lsReel: null == lsReel
          ? _value.lsReel
          : lsReel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
      videoController: freezed == videoController
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as Map<int, AVController>?,
      currentVideo: null == currentVideo
          ? _value.currentVideo
          : currentVideo // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@JsonKey(ignore: true) PageController? pageControllerMedia,
      List<ReelModel> lsReel,
      @JsonKey(ignore: true) Map<int, AVController>? videoController,
      int currentVideo});
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
    Object? pageControllerMedia = freezed,
    Object? lsReel = null,
    Object? videoController = freezed,
    Object? currentVideo = null,
  }) {
    return _then(_$ReelsStateImpl(
      pageControllerMedia: freezed == pageControllerMedia
          ? _value.pageControllerMedia
          : pageControllerMedia // ignore: cast_nullable_to_non_nullable
              as PageController?,
      lsReel: null == lsReel
          ? _value.lsReel
          : lsReel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
      videoController: freezed == videoController
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as Map<int, AVController>?,
      currentVideo: null == currentVideo
          ? _value.currentVideo
          : currentVideo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReelsStateImpl implements _ReelsState {
  _$ReelsStateImpl(
      {@JsonKey(ignore: true) this.pageControllerMedia,
      this.lsReel = const [],
      @JsonKey(ignore: true) this.videoController,
      this.currentVideo = 0});

  factory _$ReelsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReelsStateImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final PageController? pageControllerMedia;
  @override
  @JsonKey()
  final List<ReelModel> lsReel;
  @override
  @JsonKey(ignore: true)
  final Map<int, AVController>? videoController;
  @override
  @JsonKey()
  final int currentVideo;

  @override
  String toString() {
    return 'ReelsState(pageControllerMedia: $pageControllerMedia, lsReel: $lsReel, videoController: $videoController, currentVideo: $currentVideo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelsStateImpl &&
            (identical(other.pageControllerMedia, pageControllerMedia) ||
                other.pageControllerMedia == pageControllerMedia) &&
            const DeepCollectionEquality().equals(other.lsReel, lsReel) &&
            const DeepCollectionEquality()
                .equals(other.videoController, videoController) &&
            (identical(other.currentVideo, currentVideo) ||
                other.currentVideo == currentVideo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageControllerMedia,
      const DeepCollectionEquality().hash(lsReel),
      const DeepCollectionEquality().hash(videoController),
      currentVideo);

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
      {@JsonKey(ignore: true) final PageController? pageControllerMedia,
      final List<ReelModel> lsReel,
      @JsonKey(ignore: true) final Map<int, AVController>? videoController,
      final int currentVideo}) = _$ReelsStateImpl;

  factory _ReelsState.fromJson(Map<String, dynamic> json) =
      _$ReelsStateImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  PageController? get pageControllerMedia;
  @override
  List<ReelModel> get lsReel;
  @override
  @JsonKey(ignore: true)
  Map<int, AVController>? get videoController;
  @override
  int get currentVideo;

  /// Create a copy of ReelsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReelsStateImplCopyWith<_$ReelsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
