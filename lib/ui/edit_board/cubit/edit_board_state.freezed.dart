// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditBoardState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Uint8List> get imageFileList => throw _privateConstructorUsedError;
  BoardModelLocal? get boardModelLocal => throw _privateConstructorUsedError;
  DateTime get day => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditBoardStateCopyWith<EditBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBoardStateCopyWith<$Res> {
  factory $EditBoardStateCopyWith(
          EditBoardState value, $Res Function(EditBoardState) then) =
      _$EditBoardStateCopyWithImpl<$Res, EditBoardState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Uint8List> imageFileList,
      BoardModelLocal? boardModelLocal,
      DateTime day,
      String title,
      String? error});
}

/// @nodoc
class _$EditBoardStateCopyWithImpl<$Res, $Val extends EditBoardState>
    implements $EditBoardStateCopyWith<$Res> {
  _$EditBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? imageFileList = null,
    Object? boardModelLocal = freezed,
    Object? day = null,
    Object? title = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFileList: null == imageFileList
          ? _value.imageFileList
          : imageFileList // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      boardModelLocal: freezed == boardModelLocal
          ? _value.boardModelLocal
          : boardModelLocal // ignore: cast_nullable_to_non_nullable
              as BoardModelLocal?,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditBoardStateCopyWith<$Res>
    implements $EditBoardStateCopyWith<$Res> {
  factory _$$_EditBoardStateCopyWith(
          _$_EditBoardState value, $Res Function(_$_EditBoardState) then) =
      __$$_EditBoardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Uint8List> imageFileList,
      BoardModelLocal? boardModelLocal,
      DateTime day,
      String title,
      String? error});
}

/// @nodoc
class __$$_EditBoardStateCopyWithImpl<$Res>
    extends _$EditBoardStateCopyWithImpl<$Res, _$_EditBoardState>
    implements _$$_EditBoardStateCopyWith<$Res> {
  __$$_EditBoardStateCopyWithImpl(
      _$_EditBoardState _value, $Res Function(_$_EditBoardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? imageFileList = null,
    Object? boardModelLocal = freezed,
    Object? day = null,
    Object? title = null,
    Object? error = freezed,
  }) {
    return _then(_$_EditBoardState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFileList: null == imageFileList
          ? _value._imageFileList
          : imageFileList // ignore: cast_nullable_to_non_nullable
              as List<Uint8List>,
      boardModelLocal: freezed == boardModelLocal
          ? _value.boardModelLocal
          : boardModelLocal // ignore: cast_nullable_to_non_nullable
              as BoardModelLocal?,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditBoardState implements _EditBoardState {
  const _$_EditBoardState(
      {required this.isLoading,
      required final List<Uint8List> imageFileList,
      this.boardModelLocal,
      required this.day,
      required this.title,
      this.error})
      : _imageFileList = imageFileList;

  @override
  final bool isLoading;
  final List<Uint8List> _imageFileList;
  @override
  List<Uint8List> get imageFileList {
    if (_imageFileList is EqualUnmodifiableListView) return _imageFileList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFileList);
  }

  @override
  final BoardModelLocal? boardModelLocal;
  @override
  final DateTime day;
  @override
  final String title;
  @override
  final String? error;

  @override
  String toString() {
    return 'EditBoardState(isLoading: $isLoading, imageFileList: $imageFileList, boardModelLocal: $boardModelLocal, day: $day, title: $title, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditBoardState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._imageFileList, _imageFileList) &&
            (identical(other.boardModelLocal, boardModelLocal) ||
                other.boardModelLocal == boardModelLocal) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_imageFileList),
      boardModelLocal,
      day,
      title,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditBoardStateCopyWith<_$_EditBoardState> get copyWith =>
      __$$_EditBoardStateCopyWithImpl<_$_EditBoardState>(this, _$identity);
}

abstract class _EditBoardState implements EditBoardState {
  const factory _EditBoardState(
      {required final bool isLoading,
      required final List<Uint8List> imageFileList,
      final BoardModelLocal? boardModelLocal,
      required final DateTime day,
      required final String title,
      final String? error}) = _$_EditBoardState;

  @override
  bool get isLoading;
  @override
  List<Uint8List> get imageFileList;
  @override
  BoardModelLocal? get boardModelLocal;
  @override
  DateTime get day;
  @override
  String get title;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EditBoardStateCopyWith<_$_EditBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
