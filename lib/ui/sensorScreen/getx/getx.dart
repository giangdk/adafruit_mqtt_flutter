import 'package:get/get.dart';

class Appcontroller extends GetxController {
  var connect = false;
  void connected() {
    connect = true;
    update();
  }
}
