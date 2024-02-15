import 'package:flutter/material.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isTomorrow(DateTime other) {
    var tomorrow = DateTime(other.year, other.month, other.day + 1);
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool isYesterday(DateTime other) {
    var yesterday = DateTime(other.year, other.month, other.day - 1);
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool isBetween(DateTime start, DateTime end) {
    return start.isBefore(this) && end.isAfter(this);
  }

  DateTime dateOnly() {
    return DateTime(year, month, day);
  }
}

extension TimeOfDayCompare on TimeOfDay {
  bool isBefore(TimeOfDay other) {
    var thisAsDouble = hour.toDouble() + minute.toDouble() / 60;
    var otherAsDouble = other.hour.toDouble() + other.minute.toDouble() / 60;
    return thisAsDouble < otherAsDouble;
  }
}
