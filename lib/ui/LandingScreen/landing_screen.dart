import 'package:workmanager_example/const.dart';
import 'package:workmanager_example/ui/LandingScreen/components/body.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: LandingScreenBody(),
    );
  }
}
