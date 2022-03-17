import 'package:intl/intl.dart';

class DateFormatUtils {
  static String ddmmyyyy = "dd-MM-yyyy";
  static String ddmmm = "dd-MMM";
  static String ddmmmyyyy = "dd-MMM-yyyy";
  static String hhmma = "hh:mm a";
  static ddMMYYYY(DateTime dateTime) {
    final DateFormat formatter = DateFormat(ddmmyyyy);
    return formatter.format(dateTime);
  }

  static String ddMMM(String date) {
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(date);
    final DateFormat formatter = DateFormat(ddmmm);
    return formatter.format(dateTime);
  }

  static String ddMMMYYYY(String date) {
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(date);
    final DateFormat formatter = DateFormat(ddmmmyyyy);
    return formatter.format(dateTime);
  }

  static DateTime stringToDate(String date) {
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(date);
    return dateTime;
  }

  static String dateToString(DateTime date) {
    String dateTime = DateFormat("dd-MM-yyyy").format(date);
    return dateTime;
  }

  static String ddMMMFromDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM');
    return formatter.format(date);
  }

  static String ddMMyyyyFromDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  static String time24To12(String date) {
    DateTime dateTime = DateFormat("HH:mm").parse(date);
    final DateFormat formatter = DateFormat(hhmma);
    return formatter.format(dateTime);
  }

  static String dayDateFormat(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    if (aDate == today) {
      final DateFormat formatter = DateFormat("dd MMM");
      return "Today, ${formatter.format(dateTime)}";
    } else {
      final DateFormat formatter = DateFormat("EEE, dd MMM");
      return formatter.format(dateTime);
    }
  }

  static String dayDateFormat1(String dateTime) {
    final DateFormat formatter = DateFormat("EEE, dd MMM");
    return formatter.format(stringToDate(dateTime));
  }

  static String dateToDay(DateTime dateTime) {
    final DateFormat formatter = DateFormat("EEE");
    return formatter.format(dateTime);
  }

  static bool checkIfDateIsCurrentDate(String date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(date);
    final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return aDate == today;
  }

  static bool checkIfDatesAreSame(DateTime dateTime, DateTime dateTime2) {
    final firstDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final secondDate = DateTime(dateTime2.year, dateTime2.month, dateTime2.day);
    return firstDate == secondDate;
  }

  static String dayDateYearFormat(dateTime) {
    DateTime date = DateFormat("dd-MM-yyyy").parse(dateTime);
    final DateFormat formatter = DateFormat("EEE, dd MMM yyyy");
    return formatter.format(date);
  }
}
