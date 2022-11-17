import 'dart:io';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

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

String formatDate(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return DateFormat('MM/dd/yyyy').format(dateTime);
}

DateTime today() {
  return DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
}

String formatNumber(dynamic value) {
  var f = NumberFormat("###,###.00", "es_CO");
  return f.format(value);
}

String numeroJuego(int numeroJuego) {
  return numeroJuego.toString().padLeft(3, '0');
}

class FormatLocale {
  final String locale;
  const FormatLocale({this.locale = 'es_CO'});

  String currency(dynamic value) {
    numberFormatSymbols['es_CO'] = const NumberSymbols(
        NAME: "es_CO",
        DECIMAL_SEP: ',',
        GROUP_SEP: '.',
        PERCENT: '%',
        ZERO_DIGIT: '0',
        PLUS_SIGN: '+',
        MINUS_SIGN: '-',
        EXP_SYMBOL: 'E',
        PERMILL: '\u2030',
        INFINITY: '\u221E',
        NAN: 'NaN',
        DECIMAL_PATTERN: '#,##0.###',
        SCIENTIFIC_PATTERN: '#E0',
        PERCENT_PATTERN: '#,##0\u00A0%',
        CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
        DEF_CURRENCY_CODE: r'$');

    numberFormatSymbols['es_GT'] = const NumberSymbols(
        NAME: "es_EC",
        DECIMAL_SEP: '.',
        GROUP_SEP: ',',
        PERCENT: '%',
        ZERO_DIGIT: '0',
        PLUS_SIGN: '+',
        MINUS_SIGN: '-',
        EXP_SYMBOL: 'E',
        PERMILL: '\u2030',
        INFINITY: '\u221E',
        NAN: 'NaN',
        DECIMAL_PATTERN: '#,##0.###',
        SCIENTIFIC_PATTERN: '#E0',
        PERCENT_PATTERN: '#,##0\u00A0%',
        CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
        DEF_CURRENCY_CODE: r'Q');

    numberFormatSymbols['es_EC'] = const NumberSymbols(
        NAME: "es_EC",
        DECIMAL_SEP: ',',
        GROUP_SEP: '.',
        PERCENT: '%',
        ZERO_DIGIT: '0',
        PLUS_SIGN: '+',
        MINUS_SIGN: '-',
        EXP_SYMBOL: 'E',
        PERMILL: '\u2030',
        INFINITY: '\u221E',
        NAN: 'NaN',
        DECIMAL_PATTERN: '#,##0.###',
        SCIENTIFIC_PATTERN: '#E0',
        PERCENT_PATTERN: '#,##0\u00A0%',
        CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
        DEF_CURRENCY_CODE: r'$');

    numberFormatSymbols['es_PE'] = const NumberSymbols(
        NAME: "es_PE",
        DECIMAL_SEP: '.',
        GROUP_SEP: ',',
        PERCENT: '%',
        ZERO_DIGIT: '0',
        PLUS_SIGN: '+',
        MINUS_SIGN: '-',
        EXP_SYMBOL: 'E',
        PERMILL: '\u2030',
        INFINITY: '\u221E',
        NAN: 'NaN',
        DECIMAL_PATTERN: '#,##0.###',
        SCIENTIFIC_PATTERN: '#E0',
        PERCENT_PATTERN: '#,##0\u00A0%',
        CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
        DEF_CURRENCY_CODE: r'S/');

    numberFormatSymbols['es_CL'] = const NumberSymbols(
        NAME: "es_CL",
        DECIMAL_SEP: ',',
        GROUP_SEP: '.',
        PERCENT: '%',
        ZERO_DIGIT: '0',
        PLUS_SIGN: '+',
        MINUS_SIGN: '-',
        EXP_SYMBOL: 'E',
        PERMILL: '\u2030',
        INFINITY: '\u221E',
        NAN: 'NaN',
        DECIMAL_PATTERN: '#,##0.###',
        SCIENTIFIC_PATTERN: '#E0',
        PERCENT_PATTERN: '#,##0\u00A0%',
        CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
        DEF_CURRENCY_CODE: r'$');

    return NumberFormat.simpleCurrency(locale: locale, decimalDigits: 2)
        .format(value);
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  String formatNumber(dynamic value) {
    var f = NumberFormat("###,###.00", locale);
    return f.format(value);
  }

  String formatCantidad(dynamic value) {
    var f = NumberFormat("###,###", locale);
    return f.format(value);
  }

  String percent(dynamic value) {
    var f = NumberFormat("###,###", locale);
    return '${f.format(value)}%';
  }
}
