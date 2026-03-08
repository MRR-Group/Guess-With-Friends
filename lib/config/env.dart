import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get appName => dotenv.env['APP_NAME'] ?? 'App';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}