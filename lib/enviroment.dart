import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String get fileName {
    String result = 'enviroment/.env_dev';
    if (kReleaseMode) {
      result = 'enviroment/.env_prod';
    }

    if (kDebugMode) {
      result = 'enviroment/.env_dev';
    }

    if (kProfileMode) {
      result = 'enviroment/.env_qa';
    }

    return result;
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? '';
  }
}