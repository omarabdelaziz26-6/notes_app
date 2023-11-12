import 'package:intl/intl.dart';

String customEditDateFormatFunction({required String dateAsString}) {
  DateTime x = DateTime.parse(dateAsString);
  String y = DateFormat("hh:mm  MMMM  d,y").format(x);
  // var z = DateFormat.yMMMMd().format(x);
  // log(y.toString());
  return y;
}