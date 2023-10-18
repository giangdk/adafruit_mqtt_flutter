import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_board_state.freezed.dart';

@freezed
class DetailBoardState with _$DetailBoardState {
  const factory DetailBoardState(
      {required bool isLoading,
      BoardModelLocal? boardModelLocal,
      String? error}) = _DetailBoardState;

  factory DetailBoardState.initial({
    String? id,
  }) =>
      const DetailBoardState(
        isLoading: false,
      );
}
