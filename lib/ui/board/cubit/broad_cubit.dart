import 'dart:async';

import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/ui/board/cubit/broad_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/ui/connect_host/connect_host.dart';

class BroadCubit extends Cubit<BroadState> {
  BroadCubit() : super(BroadState.initial());

  final _cacheManager = CacheManager.instance;
  late Timer? _timer = null;
  final simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";

  @override
  Future<void> close() {
    emit(state.copyWith(isDestroy: true));
    // TODO: implement close
    _timer!.cancel();
    // client.disconnect();
    return super.close();
  }

  void init() async {
    // await concectBroker(disconnect: () {}, connect: () {});
    // Timer(Duration(seconds: 5), () {
    _manageMQTT();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      _manageMQTT();
      // });
    });
  }

  Future<void> _manageMQTT() async {
    try {
      print("giang push mess LED1 - 0");
      List<BoardModelLocal> dataLocal = await _cacheManager.getAllBoard();
      dataLocal = dataLocal.map((e) {
        DateTime now = DateTime.now();
        var hnow = now.hour;
        var mnow = now.minute;
        int hModel = (e.timeDuration! / 60).toInt();
        int mModel = e.timeDuration! % 60;
        int secondNow = hnow * 3600 + mnow * 60;
        int secondModel = hModel * 3600 + mModel * 60;
        if (e.isEnable == true && secondNow > secondModel) {
          switch (e.model) {
            //"Đèn", "Quạt", "Cửa sổ"
            //"Tắt", "Mở", "Tự động"
            case "Đèn":
              if (e.statusModel == "Tắt") {
                pushMess("led1", "0");
              } else if (e.statusModel == "Mở") {
                pushMess("led1", "1");
              } else {}
              break;
            case "Quạt":
              if (e.statusModel == "Tắt") {
                pushMess("fan", "0");
              } else if (e.statusModel == "Mở") {
                pushMess("fan", "1");
              } else {
                pushMess("afan", "1");
              }
              break;
            case "Cửa sổ":
              if (e.statusModel == "Tắt") {
                pushMess("door", "0");
              } else if (e.statusModel == "Mở") {
                pushMess("door", "1");
              } else {
                pushMess("adoor", "1");
              }
              break;
          }

          return e.copyWith(isEnable: false);
        } else
          return e;
      }).toList();
      _cacheManager.addAllBoard(dataLocal);
      state.isDestroy == false ? emit(state.copyWith(listBoardLocal: dataLocal)) : null;
    } catch (e) {
      e;
    }
  }

  Future<void> setStatus(BoardModelLocal boardModelLocal) async {
    _cacheManager.addBoardToCache(boardModelLocal.copyWith(isEnable: !boardModelLocal.isEnable!));
    init();
  }
}
