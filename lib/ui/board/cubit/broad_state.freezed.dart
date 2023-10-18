// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broad_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BroadState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDestroy => throw _privateConstructorUsedError;
  List<BoardModelLocal> get listBoardLocal =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BroadStateCopyWith<BroadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BroadStateCopyWith<$Res> {
  factory $BroadStateCopyWith(
          BroadState value, $Res Function(BroadState) then) =
      _$BroadStateCopyWithImpl<$Res, BroadState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isDestroy,
      List<BoardModelLocal> listBoardLocal,
      String? error});
}

/// @nodoc
class _$BroadStateCopyWithImpl<$Res, $Val extends BroadState>
    implements $BroadStateCopyWith<$Res> {
  _$BroadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDestroy = null,
    Object? listBoardLocal = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDestroy: null == isDestroy
          ? _value.isDestroy
          : isDestroy // ignore: cast_nullable_to_non_nullable
              as bool,
      listBoardLocal: null == listBoardLocal
          ? _value.listBoardLocal
          : listBoardLocal // ignore: cast_nullable_to_non_nullable
              as List<BoardModelLocal>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BroadStateCopyWith<$Res>
    implements $BroadStateCopyWith<$Res> {
  factory _$$_BroadStateCopyWith(
          _$_BroadState value, $Res Function(_$_BroadState) then) =
      __$$_BroadStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isDestroy,
      List<BoardModelLocal> listBoardLocal,
      String? error});
}

/// @nodoc
class __$$_BroadStateCopyWithImpl<$Res>
    extends _$BroadStateCopyWithImpl<$Res, _$_BroadState>
    implements _$$_BroadStateCopyWith<$Res> {
  __$$_BroadStateCopyWithImpl(
      _$_BroadState _value, $Res Function(_$_BroadState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDestroy = null,
    Object? listBoardLocal = null,
    Object? error = freezed,
  }) {
    return _then(_$_BroadState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDestroy: null == isDestroy
          ? _value.isDestroy
          : isDestroy // ignore: cast_nullable_to_non_nullable
              as bool,
      listBoardLocal: null == listBoardLocal
          ? _value._listBoardLocal
          : listBoardLocal // ignore: cast_nullable_to_non_nullable
              as List<BoardModelLocal>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BroadState implements _BroadState {
  const _$_BroadState(
      {required this.isLoading,
      required this.isDestroy,
      required final List<BoardModelLocal> listBoardLocal,
      this.error})
      : _listBoardLocal = listBoardLocal;

  @override
  final bool isLoading;
  @override
  final bool isDestroy;
  final List<BoardModelLocal> _listBoardLocal;
  @override
  List<BoardModelLocal> get listBoardLocal {
    if (_listBoardLocal is EqualUnmodifiableListView) return _listBoardLocal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBoardLocal);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'BroadState(isLoading: $isLoading, isDestroy: $isDestroy, listBoardLocal: $listBoardLocal, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BroadState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDestroy, isDestroy) ||
                other.isDestroy == isDestroy) &&
            const DeepCollectionEquality()
                .equals(other._listBoardLocal, _listBoardLocal) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isDestroy,
      const DeepCollectionEquality().hash(_listBoardLocal), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BroadStateCopyWith<_$_BroadState> get copyWith =>
      __$$_BroadStateCopyWithImpl<_$_BroadState>(this, _$identity);
}

abstract class _BroadState implements BroadState {
  const factory _BroadState(
      {required final bool isLoading,
      required final bool isDestroy,
      required final List<BoardModelLocal> listBoardLocal,
      final String? error}) = _$_BroadState;

  @override
  bool get isLoading;
  @override
  bool get isDestroy;
  @override
  List<BoardModelLocal> get listBoardLocal;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_BroadStateCopyWith<_$_BroadState> get copyWith =>
      throw _privateConstructorUsedError;
}
