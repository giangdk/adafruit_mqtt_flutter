import 'package:auto_route/auto_route.dart';
import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      this.leading,
      this.title,
      this.leftWidget,
      this.trailing,
      this.isBack = false})
      : super(key: key);
  final Widget? leading;
  final String? title;
  final Widget? leftWidget;
  final Widget? trailing;
  final bool? isBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
      margin: const EdgeInsets.only(
          bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
      //margin: const EdgeInsets.only(bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: isBack == true,
                    child: GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 4, right: 6),
                          child: const Icon(
                            Ionicons.chevron_back_outline,
                            size: 23,
                            color: Colors.black,
                          )),
                    )),
                Visibility(
                    visible: leading != null,
                    child: Container(
                        margin: EdgeInsets.only(right: kDefaultPaddingWidget),
                        child: leading ?? Container())),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Visibility(
                        visible: title != null,
                        child: Text(
                          title ?? "",
                          style: headerTitleStyle.copyWith(
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ),
                Visibility(
                    visible: leftWidget != null,
                    child: leftWidget ?? Container())
              ],
            ),
          ),
          Visibility(
            visible: trailing != null,
            child: trailing ?? Container(),
          )
        ],
      ),
    );
  }
}
