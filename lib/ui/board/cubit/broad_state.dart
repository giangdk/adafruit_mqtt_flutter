import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'broad_state.freezed.dart';

@freezed
class BroadState with _$BroadState {
  const factory BroadState(
      {required bool isLoading,
      required bool isDestroy,
      required List<BoardModelLocal> listBoardLocal,
      String? error}) = _BroadState;

  factory BroadState.initial({
    String? id,
  }) =>
      const BroadState(
        listBoardLocal: [],
        isDestroy: false,
        isLoading: false,
      );
}
