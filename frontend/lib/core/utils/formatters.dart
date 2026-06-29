import 'package:intl/intl.dart';

class Formatters {
  static final _currency = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
  static final _compact = NumberFormat.compactCurrency(symbol: '₹', decimalDigits: 1);
  static final _dateShort = DateFormat('dd MMM yyyy');
  static final _dateMedium = DateFormat('MMM dd, yyyy');
  static final _dateTime = DateFormat('dd MMM yyyy, hh:mm a');
  static final _monthYear = DateFormat('MMMM yyyy');

  static String currency(double amount) => _currency.format(amount);
  static String compactCurrency(double amount) => _compact.format(amount);
  static String dateShort(DateTime date) => _dateShort.format(date);
  static String dateMedium(DateTime date) => _dateMedium.format(date);
  static String dateTime(DateTime date) => _dateTime.format(date);
  static String monthYear(DateTime date) => _monthYear.format(date);

  static String percentage(double value) => '${value.toStringAsFixed(1)}%';
}
