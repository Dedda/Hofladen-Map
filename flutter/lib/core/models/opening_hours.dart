import 'package:flutter/material.dart';

class OpeningHours {
  final TimeOfDay opens;
  final TimeOfDay closes;
  final int day;

  OpeningHours({
    required this.opens,
    required this.closes,
    required this.day,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      opens: timeFromString(json['opens']),
      closes: timeFromString(json['closes']),
      day: json['day'],
    );
  }
}

class OpeningHoursHolidays {
  final TimeOfDay opens;
  final TimeOfDay closes;
  final DateTime day;

  OpeningHoursHolidays({
    required this.opens,
    required this.closes,
    required this.day,
  });

  factory OpeningHoursHolidays.fromJson(final Map<String, dynamic> json) {
    return OpeningHoursHolidays(
      opens: timeFromString(json['opens']),
      closes: timeFromString(json['closes']),
      day: DateTime.parse(json['day']),
    );
  }
}

TimeOfDay timeFromString(final String formatted) {
  final split = formatted.split(":");
  return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
}
