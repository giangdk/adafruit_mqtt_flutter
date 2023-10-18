import 'package:workmanager_example/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorSignIn extends StatelessWidget {
  const IndicatorSignIn({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 10,
      height: 10,
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey),
          color: isActive ? kOrangeColor : Colors.grey,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
