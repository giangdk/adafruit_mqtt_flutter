import 'package:workmanager_example/const.dart';

import 'package:workmanager_example/ui/sensorScreen/widget/body.dart';
import 'package:flutter/material.dart';

class SensorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SensorScreenBody(),
    );
  }
}
