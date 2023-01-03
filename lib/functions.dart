import 'package:intl/intl.dart';

abstract class Functions {
  // String getTodayDateinApiFormat(DateTime dates) {
  //   var f = DateFormat('dd MMM yyyy HH:mm:ss');
  //   var date = f.format(DateTime.now().toUtc()) + " GMT";
  //   print(date);
  //   return date;
  // }

  static String getDateinApiFormat(DateTime dates) {
    var f = DateFormat('dd MMM yyyy HH:mm:ss');
    var date = f.format(dates) + " GMT";
    // print(date);
    return date;
  }

  static DateTime dateAgo(DateTime startDate, int daysBack) {
    final today = startDate;
    final daysAgo = today.subtract(Duration(days: daysBack));
    return daysAgo;
  }
}
