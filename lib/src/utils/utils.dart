import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String convertDateMonthYearTime(DateTime value) {
    return DateFormat('dd MMM yyyy • HH:mm').format(value.toLocal());
  }
}
