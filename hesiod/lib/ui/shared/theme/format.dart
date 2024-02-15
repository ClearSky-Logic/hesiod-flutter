import 'package:intl/intl.dart';

class AppFormat {
  static final DateFormat _timeFormatter = DateFormat("h:mm a");

  static String formatTime(DateTime time) {
    return _timeFormatter.format(time);
  }

  static String formatDate(DateTime date, {bool showWeekDay = true}) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("${showWeekDay ? 'EEEE ' : ''}d'$suffix' MMMM")
        .format(date);
  }

  static String formatAbbreviatedDate(DateTime date,
      {bool showWeekDay = false}) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("${showWeekDay ? 'E ' : ''}d'$suffix' MMM").format(date);
  }
}
