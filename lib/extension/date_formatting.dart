import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String tohhmmddMMyyyy() {
    final f = DateFormat('hh:mm dd/MM/yyyy');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toHHmm() {
    final f = DateFormat('HH:mm');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toddMMyyyy() {
    final f = DateFormat('dd/MM/yyyy');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toyyyy() {
    final f = DateFormat('yyyy');
    return f.format(this);
  }

  String toLocalTime() {
    final f = DateFormat('dd/MM/yyyy');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toEEEMMMd() {
    // final f = DateFormat('EEE, MMM d');
    final f = DateFormat.MMMEd('vi_VN');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toEEEMMMdY() {
    // final f = DateFormat('EEE, MMM d');
    final f = DateFormat.yMMMEd();
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }
}

extension FormatDayShip on DateTime {
  String format() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format() +
        ', Ngày ' +
        DateFormat('dd').format(this) +
        ' Tháng ' +
        DateFormat('MM').format(this) +
        ' ' +
        DateFormat('yyyy').format(this);
  }

  String format2() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format() +
        ' Ngày ' +
        DateFormat('dd').format(this) +
        ' tháng ' +
        DateFormat('MM').format(this) +
        ' ' +
        DateFormat('yyyy').format(this);
  }

  String format3() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format();
  }

  String format4() {
    return '${DateFormat('dd').format(this)} Tháng ${DateFormat('MM').format(this)} ${DateFormat('yyyy').format(this)}';
  }
}

extension FormatDayOfWeek on DateTime {
  String format() {
    return dayOfWeekToString(DateFormat('E').format(this));
  }
}

String dayOfWeekToString(String day) {
  switch (day) {
    case 'Mon':
      return '2';
    case 'Tue':
      return "3";
    case 'Wed':
      return "4";
    case 'Thu':
      return "5";
    case 'Fri':
      return "6";
    case 'Sat':
      return "7";
    default:
      return "Chủ nhật";
  }
}

unfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
  TextEditingController().clear();
}

extension FormatTime on DateTime {
  String format() {
    return DateFormat('hh:mm').format(this);
  }
}
