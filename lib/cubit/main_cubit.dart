import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:workmanager_example/cubit/main_state.dart';
import 'package:workmanager_example/data/cache_manager.dart';
import 'package:workmanager_example/data/model/board_local/board_model.dart';
import 'package:workmanager_example/ui/connect_host/connect_host.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  final _cacheManager = CacheManager.instance;
  late Timer? _timer = null;
  void initdata() async {
    print("giang push mess led1 - 0");
    // pushMess("led1", "0");
    print("giang push mess led1 - 0");
    _manageMQTT();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      _manageMQTT();
      // });
    });
  }

  Future<void> _manageMQTT() async {
    pushMess("led1", "0");
    // print("giang push mess led1 - 0");
    List<BoardModelLocal> dataLocal = await _cacheManager.getAllBoard();
    dataLocal = dataLocal.map((e) {
      DateTime now = DateTime.now();
      var hnow = now.hour;
      var mnow = now.minute;
      int hModel = (e.timeDuration! / 60).toInt();
      int mModel = e.timeDuration! % 60;
      int secondNow = hnow * 3600 + mnow * 60;
      int secondModel = hModel * 3600 + mModel * 60;
      if (e.isEnable == true && secondNow > secondModel && client.connectionStatus!.state == MqttConnectionState.connected) {
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
  }
}
