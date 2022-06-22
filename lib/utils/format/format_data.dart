import 'package:intl/intl.dart';

int dateToInt(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch;
}

DateTime intToDate(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}

String intToDateString(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
}

int nowToInt() {
  return (DateTime.now().millisecondsSinceEpoch);
}

String formatDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return DateFormat('MM/dd/yyyy hh:mm a').format(dateTime);
}

DateTime today() {
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
}

String formatNumber(dynamic value) {
  var f = NumberFormat("###,###.00", "es_ES");
  return f.format(value);
}

String numeroJuego(int numeroJuego) {
  return numeroJuego.toString().padLeft(3, '0');
}
