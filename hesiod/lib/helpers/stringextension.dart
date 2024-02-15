extension StringValidators on String {
  bool isValidEmail() => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool isValidPassword() =>
      length >= 8 &&
      RegExp(r'^(?=.*[A-Z])').hasMatch(this) &&
      RegExp(r'^(?=.*\d)').hasMatch(this);

  String removeZeroPrefix() => replaceFirst(RegExp(r'^0+'), '');

  bool isValidSortCode() => RegExp(r'^\d{2}-\d{2}-\d{2}$').hasMatch(this);

  bool isValidAccountNumber() => RegExp(r'^\d{8}$').hasMatch(this);

  bool isValidWebsite() => RegExp(
          r"^$|^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$")
      .hasMatch(this);

  bool isValidUkPostcode() =>
      RegExp(r'^[a-zA-Z]{1,2}[0-9][0-9a-zA-Z]?\s?[0-9][a-zA-Z]{2}$')
          .hasMatch(this);

  bool isValidIrishPostcode() =>
      RegExp(r'^([AC-FHKNPRTV-Y]{1}[0-9]{2}|D6W)[ ]?[0-9AC-FHKNPRTV-Y]{4}$')
          .hasMatch(this);

  bool isValidLatvianPostcode() =>
      RegExp(r'^[Ll][Vv][- ]?[0-9]{4}$').hasMatch(this);

  bool isValidLithuanianPostcode() =>
      RegExp(r'^[Ll][Tt][- ]?[0-9]{5}$').hasMatch(this);

  bool isValidEstonianPostcode() => RegExp(r'^[0-9]{5}$').hasMatch(this);

  bool isValidSpanishPostcode() =>
      RegExp(r'^(?:0[1-9]|[1-4]\d|5[0-2])\d{3}$').hasMatch(this);

  bool isValidFrenchPostcode() =>
      RegExp(r'^(?:0[1-9]|[1-8]\d|9[0-8])\d{3}$').hasMatch(this);

  bool isValidGermanPostcode() => RegExp(r'^[0-9]{5}$').hasMatch(this);

  bool isValidPortuguesePostcode() =>
      RegExp(r'^[0-9]{4}(-[0-9]{3})?$').hasMatch(this);

  bool isValidIban() => RegExp(
          r'^AL\d{10}[0-9A-Z]{16}$|^AD\d{10}[0-9A-Z]{12}$|^AT\d{18}$|^BH\d{2}[A-Z]{4}[0-9A-Z]{14}$|^BE\d{14}$|^BA\d{18}$|^BG\d{2}[A-Z]{4}\d{6}[0-9A-Z]{8}$|^HR\d{19}$|^CY\d{10}[0-9A-Z]{16}$|^CZ\d{22}$|^DK\d{16}$|^FO\d{16}$|^GL\d{16}$|^DO\d{2}[0-9A-Z]{4}\d{20}$|^EE\d{18}$|^FI\d{16}$|^FR\d{12}[0-9A-Z]{11}\d{2}$|^GE\d{2}[A-Z]{2}\d{16}$|^DE\d{20}$|^GI\d{2}[A-Z]{4}[0-9A-Z]{15}$|^GR\d{9}[0-9A-Z]{16}$|^HU\d{26}$|^IS\d{24}$|^IE\d{2}[A-Z]{4}\d{14}$|^IL\d{21}$|^IT\d{2}[A-Z]\d{10}[0-9A-Z]{12}$|^[A-Z]{2}\d{5}[0-9A-Z]{13}$|^KW\d{2}[A-Z]{4}22!$|^LV\d{2}[A-Z]{4}[0-9A-Z]{13}$|^LB\d{6}[0-9A-Z]{20}$|^LI\d{7}[0-9A-Z]{12}$|^LT\d{18}$|^LU\d{5}[0-9A-Z]{13}$|^MK\d{5}[0-9A-Z]{10}\d{2}$|^MT\d{2}[A-Z]{4}\d{5}[0-9A-Z]{18}$|^MR13\d{23}$|^MU\d{2}[A-Z]{4}\d{19}[A-Z]{3}$|^MC\d{12}[0-9A-Z]{11}\d{2}$|^ME\d{20}$|^NL\d{2}[A-Z]{4}\d{10}$|^NO\d{13}$|^PL\d{10}[0-9A-Z]{,16}n$|^PT\d{23}$|^RO\d{2}[A-Z]{4}[0-9A-Z]{16}$|^SM\d{2}[A-Z]\d{10}[0-9A-Z]{12}$|^SA\d{4}[0-9A-Z]{18}$|^RS\d{20}$|^SK\d{22}$|^SI\d{17}$|^ES\d{22}$|^SE\d{22}$|^CH\d{7}[0-9A-Z]{12}$|^TN59\d{20}$|^TR\d{7}[0-9A-Z]{17}$|^AE\d{21}$|^GB\d{2}[A-Z]{4}\d{14}$')
      .hasMatch(this);

  bool isValidBicSwift() =>
      RegExp(r'^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$').hasMatch(this);

  String get capitalise => '${this[0].toUpperCase()}${substring(1)}';

  bool isValidMobileNumber() => length >= 7 && length <= 25;
}
