import 'package:intl/intl.dart';

class ValueFormatter {
  String withDecimal(double? value) =>
      NumberFormat("###,##0.00", "en_GB").format(value);

  String withoutDecimal(double? value) =>
      NumberFormat('#,##,##0').format(value);
}
