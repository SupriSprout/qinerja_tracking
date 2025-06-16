import 'dart:ui';

import 'package:intl/intl.dart';

class BrandConfig {
  static Color getColor(
      {required bool isQinerja,
      required Color lbColor,
      required Color qinerjaColor}) {
    if (isQinerja) {
      return lbColor;
    } else {
      return qinerjaColor;
    }
  }

  static String convertDateMonthYearTime(DateTime value) {
  return DateFormat('dd MMM yyyy • HH:mm')
      .format(value.toLocal());
}
}
