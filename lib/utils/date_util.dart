import 'package:intl/intl.dart';

class DateUtil {
  /// Private constructor for avoiding object creation
  DateUtil._();

  static const String defaultDateFormat = 'yyyy-MM-dd';

  static int getEpochTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// [dateTime] user input date otherwise use current time
  /// [dateFormat] user formatted otherwise use default format
  static String getDefaultFormattedDate(
      {DateTime? dateTime, String? dateFormat}) {
    return DateFormat(dateFormat ?? defaultDateFormat)
        .format(dateTime ?? DateTime.now());
  }
}
