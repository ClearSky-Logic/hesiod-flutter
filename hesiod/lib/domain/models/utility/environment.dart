import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
  static bool get debugBanner =>
      dotenv.env['DEBUG_BANNER'] == 'true' ? true : false;
}
