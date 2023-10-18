import 'package:bloc/bloc.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/ui/detail_board/cubit/detail_board_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DetailBoardCubit extends Cubit<DetailBoardState> {
  DetailBoardCubit() : super(DetailBoardState.initial());
  final _cacheManager = CacheManager.instance;
  void init(BoardModelLocal boardModelLocal) {
    emit(state.copyWith(boardModelLocal: boardModelLocal));
  }

  Future<void> getBoardCached(String id) async {
    List<BoardModelLocal> dataCache = _cacheManager.getAllBoard();
    BoardModelLocal boardModelLocal =
        dataCache.where((element) => element.id == id).toList().first;
    emit(state.copyWith(boardModelLocal: boardModelLocal));
  }

  void deleteBoard() {
    _cacheManager.deleteBoard(state.boardModelLocal!);
  }
}
