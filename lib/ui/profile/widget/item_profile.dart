import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProfile extends StatelessWidget {
  final bool? isBottomLine;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onPress;
  final Color? itemColor;
  final Color? colortext;
  const ItemProfile(
      {Key? key,
      this.isBottomLine = true,
      required this.title,
      this.subtitle,
      this.icon,
      this.itemColor,
      this.colortext,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
            border: Border(
                bottom: isBottomLine!
                    ? BorderSide(color: secondaryColor60, width: 1)
                    : const BorderSide(color: Colors.transparent))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: colortext != null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle.copyWith(
                          fontSize: 15, color: colortext ?? titleColor),
                    ),
                  ],
                ),
              ),
            ),
            subtitle != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitle ?? "",
                          style: titleStyle.copyWith(
                              fontSize: 15,
                              color: colortext ?? greyPrymaryColor),
                        ),
                      ],
                    ),
                  )
                : Container(),
            itemColor != null
                ? Container(
                    width: 18,
                    height: 18,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  )
                : Container(),
            colortext == null
                ? Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: greyPrymaryColor,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
