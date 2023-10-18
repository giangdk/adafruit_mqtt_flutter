import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {Key? key,
      this.title,
      this.hint,
      this.controller,
      this.titleStyleIn,
      this.isEnable = true,
      this.colorBorder,
      this.prefixIcon,
      this.onTapPrefixIcon,
      this.maxLines = 1,
      this.widget})
      : super(key: key);
  final String? title;
  final String? hint;
  final Color? colorBorder;
  final bool? isEnable;
  final TextEditingController? controller;
  final TextStyle? titleStyleIn;
  final Widget? widget;
  final Widget? prefixIcon;
  final Function? onTapPrefixIcon;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title!,
                  style: titleStyleIn ?? titleStyle,
                )
              : Container(),
          Container(
            //height: 52,
            padding: EdgeInsets.only(left: 14, top: 4),
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  child: TextFormField(
                    autofocus: false,
                    readOnly: !(isEnable ?? true),
                    //textAlign: TextAlign.start,
                    cursorColor: colorBorder ??
                        (Get.isDarkMode ? Colors.grey[100] : Colors.grey[700]),
                    controller: controller,
                    maxLines: maxLines,

                    style: titleStyle.copyWith(
                        height: 1,
                        wordSpacing: 0.2,
                        letterSpacing: 0.5,
                        fontSize: 15,
                        color: const Color(0xff1C2433)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      suffixIcon: prefixIcon != null
                          ? InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: prefixIcon,
                              ),
                              onTap: () {
                                onTapPrefixIcon?.call();
                              },
                            )
                          : null,
                      // enabledBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(
                      //         color: colorBorder ??
                      //             context.theme.backgroundColor,
                      //         width: 0)),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(
                      //         color: colorBorder ??
                      //             context.theme.backgroundColor,
                      //         width: 0))
                    ),
                  ),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
