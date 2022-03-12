import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date) {
    DateFormat formatter = DateFormat('dd MMM yyyy, hh:mm a');
    DateTime? parsed =
        DateFormat('yyyy-MM-ddTHH:mm:ss').parse(date, true).toLocal();

    DateTime now = DateTime.now();
    DateTime justNow = DateTime.now().subtract(const Duration(minutes: 1));
    DateTime localDateTime = parsed.toLocal();
    if (!localDateTime.difference(justNow).isNegative) {
      return 'Just now';
    }

    String roughTimeString = DateFormat('jm').format(parsed);
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Today, ' + roughTimeString;
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (localDateTime.day == yesterday.day &&
        localDateTime.month == yesterday.month &&
        localDateTime.year == yesterday.year) {
      return 'Yesterday, ' + roughTimeString;
    }
    return formatter.format(parsed);
  }

  static String customFormat(DateTime dateTime,
      {String? format = 'yyyy-MM-dd'}) {
    String formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }

  static DateTime convertDateFromString(String strDate, {String? format}) {
    DateTime todayDate = DateFormat(format ?? 'yyyy-MM-ddThh:mm:ss')
        .parse(strDate, true)
        .toLocal();
    return todayDate;
  }

  static String formatFromDate(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }
}
