import 'package:intl/intl.dart';

class DaysCounter {
  int dayCounter({required String closeDate}) {
    DateTime dateTimeCreatedAt = DateTime.parse(closeDate);
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays =
        dateTimeCreatedAt.difference(dateTimeNow).inDays + 2;
    return differenceInDays;
  }

  String dateMethod({required String date}) {
    var dateFormat = DateFormat('dd MMM yyyy');
    var days = dayCounter(closeDate: date);
    final now = DateTime.now();
    final dateFromData = dateFormat.format(DateTime.parse(date));
    final today = dateFormat.format(DateTime(now.year, now.month, now.day));
    final tomorrow =
        dateFormat.format(DateTime(now.year, now.month, now.day + 1));
    if (today == dateFromData) {
      return 'Closing today';
    } else if (tomorrow == dateFromData) {
      return 'Closing tomorrow';
    } else if (days < 2) {
      return 'Closed on ${dateFormat.format(DateTime.parse(date))}';
    } else {
      return 'Closing in $days days on ${dateFormat.format(DateTime.parse(date))}';
    }
  }
}
