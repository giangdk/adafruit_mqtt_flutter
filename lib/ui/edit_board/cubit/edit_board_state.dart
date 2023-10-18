import 'dart:typed_data';

import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_board_state.freezed.dart';

@freezed
class EditBoardState with _$EditBoardState {
  const factory EditBoardState(
      {required bool isLoading,
      required List<Uint8List> imageFileList,
      BoardModelLocal? boardModelLocal,
      required DateTime day,
      required String title,
      String? error}) = _EditBoardState;

  factory EditBoardState.initial({
    String? id,
  }) =>
      EditBoardState(
          isLoading: false, day: DateTime.now(), title: "", imageFileList: []);
}
