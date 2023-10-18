import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const MediaButtonWidget(
      {Key? key, required this.icon, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              3,
            ),
            border: Border.all(color: primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: primaryColor,
            ),
            Text(
              title,
              style: subHeadingStyle.copyWith(
                  color: primaryColor, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    ));
  }
}
