import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle get textCategoryNameStyle {
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(
      fontSize: 14,
      color: false ? Colors.white : Colors.grey[500],
      fontWeight: FontWeight.w500);
}

TextStyle get headingStyle {
  return TextStyle(
      fontSize: 16,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get headerTitleStyle {
  return TextStyle(
      fontSize: 17,
      height: 1.3,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get titleStyle {
  return TextStyle(
      fontSize: 14,
      height: 1.3,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get subTitleStyle {
  return TextStyle(
      fontSize: 12,
      height: 1.3,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      color: false ? Colors.white : Colors.grey[500],
      fontWeight: FontWeight.w400);
}

// final TextStyle subTitleStyle2 = TextStyle(
//     fontSize: 12,
//     color: false ? Colors.white : Colors.grey[500],
//     fontWeight: FontWeight.w400);

TextStyle get subTitlePrimaryColorStyle {
  return TextStyle(
      fontSize: 13,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w400);
}

TextStyle get categoryTitleStyle {
  return TextStyle(
      fontSize: 16,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get buttonTitleStyle {
  return TextStyle(
      fontSize: 15,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500);
}

TextStyle get buttonSmallTitleStyle {
  return TextStyle(
      fontSize: 8,
      color: false ? Colors.white : Colors.white,
      fontWeight: FontWeight.w500);
}

TextStyle get headingSuccessStyle {
  return TextStyle(
      fontSize: 22,
      color: false ? Colors.white : Colors.black,
      fontWeight: FontWeight.w400);
}
