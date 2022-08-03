import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeHelper on DateTime {
  String parseToString({String format = 'dd MMM yyyy'}) {
    final parsedDate = (this).toLocal();
    final formattedDate = DateFormat(format).format(parsedDate);
    return formattedDate;
  }

  String dayMonthYearHourMinuteDate() {
    return parseToString(format: 'dd MMM yyyy, HH:mm');
  }

  String dateTimeAgo() {
    return timeago.format(this, locale: 'id');
  }
}
