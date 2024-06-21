//format date and time and check if date is today or yesterday or other
//if today return today else return yesterday + time

import 'dart:ui';

import 'package:intl/intl.dart';

String formatDateAndTime(String date) {
  DateTime dateTime = DateTime.parse(date);
  DateTime now = DateTime.now();
  if (dateTime.day == now.day &&
      dateTime.month == now.month &&
      dateTime.year == now.year) {
    return 'Today ${DateFormat('h:mm a').format(dateTime)}';
  } else if (dateTime.day == now.subtract(const Duration(days: 1)).day &&
      dateTime.month == now.subtract(const Duration(days: 1)).month &&
      dateTime.year == now.subtract(const Duration(days: 1)).year) {
    return 'Yesterday ${DateFormat('h:mm a').format(dateTime)}';
  } else {
    return DateFormat('dd MMM yyyy, h:mm a').format(dateTime);
  }
}

//split username and return first letter
String getInitials(String name) {
  return name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join('').toUpperCase()
      : '';
}

//generate color from name
Color generateColor(String name) {
  final hash = name.hashCode;
  final red = hash & 0xFF;
  final green = (hash >> 8) & 0xFF;
  final blue = (hash >> 16) & 0xFF;
  return Color.fromARGB(255, red, green, blue);
}
