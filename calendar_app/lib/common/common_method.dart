import 'package:intl/intl.dart';

class CommonMethod {
  static String dateFormatToString(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
