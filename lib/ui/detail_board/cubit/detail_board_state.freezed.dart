// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailBoardState {
  bool get isLoading => throw _privateConstructorUsedError;
  BoardModelLocal? get boardModelLocal => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailBoardStateCopyWith<DetailBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailBoardStateCopyWith<$Res> {
  factory $DetailBoardStateCopyWith(
          DetailBoardState value, $Res Function(DetailBoardState) then) =
      _$DetailBoardStateCopyWithImpl<$Res, DetailBoardState>;
  @useResult
  $Res call({bool isLoading, BoardModelLocal? boardModelLocal, String? error});
}

/// @nodoc
class _$DetailBoardStateCopyWithImpl<$Res, $Val extends DetailBoardState>
    implements $DetailBoardStateCopyWith<$Res> {
  _$DetailBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? boardModelLocal = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      boardModelLocal: freezed == boardModelLocal
          ? _value.boardModelLocal
          : boardModelLocal // ignore: cast_nullable_to_non_nullable
              as BoardModelLocal?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailBoardStateCopyWith<$Res>
    implements $DetailBoardStateCopyWith<$Res> {
  factory _$$_DetailBoardStateCopyWith(
          _$_DetailBoardState value, $Res Function(_$_DetailBoardState) then) =
      __$$_DetailBoardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, BoardModelLocal? boardModelLocal, String? error});
}

/// @nodoc
class __$$_DetailBoardStateCopyWithImpl<$Res>
    extends _$DetailBoardStateCopyWithImpl<$Res, _$_DetailBoardState>
    implements _$$_DetailBoardStateCopyWith<$Res> {
  __$$_DetailBoardStateCopyWithImpl(
      _$_DetailBoardState _value, $Res Function(_$_DetailBoardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? boardModelLocal = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_DetailBoardState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      boardModelLocal: freezed == boardModelLocal
          ? _value.boardModelLocal
          : boardModelLocal // ignore: cast_nullable_to_non_nullable
              as BoardModelLocal?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DetailBoardState implements _DetailBoardState {
  const _$_DetailBoardState(
      {required this.isLoading, this.boardModelLocal, this.error});

  @override
  final bool isLoading;
  @override
  final BoardModelLocal? boardModelLocal;
  @override
  final String? error;

  @override
  String toString() {
    return 'DetailBoardState(isLoading: $isLoading, boardModelLocal: $boardModelLocal, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailBoardState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.boardModelLocal, boardModelLocal) ||
                other.boardModelLocal == boardModelLocal) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, boardModelLocal, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailBoardStateCopyWith<_$_DetailBoardState> get copyWith =>
      __$$_DetailBoardStateCopyWithImpl<_$_DetailBoardState>(this, _$identity);
}

abstract class _DetailBoardState implements DetailBoardState {
  const factory _DetailBoardState(
      {required final bool isLoading,
      final BoardModelLocal? boardModelLocal,
      final String? error}) = _$_DetailBoardState;

  @override
  bool get isLoading;
  @override
  BoardModelLocal? get boardModelLocal;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_DetailBoardStateCopyWith<_$_DetailBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
