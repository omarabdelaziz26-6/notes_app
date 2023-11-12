import 'package:intl/intl.dart';

String customDateFormatFunction({required String dateAsString}) {
  DateTime x = DateTime.parse(dateAsString);
  var y = DateFormat("MMMM  d,y").format(x);
  // var z = DateFormat.yMMMMd().format(x);
  // log(y.toString());
  return y;
}
