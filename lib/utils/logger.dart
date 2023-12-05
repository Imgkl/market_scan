import 'package:logger/logger.dart' as logger;

class Logger {
  static final _logger = logger.Logger(
    printer: logger.PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      printTime: true,
      colors: true,
    ),
  );

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void fatal(String message) {
    _logger.f(message);
  }
}
