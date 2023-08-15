import 'dart:io';

enum Logger {
  verbose(0),
  debug(500),
  info(1000),
  warning(1250),
  error(1500),
  fatal(2000);

  static int _level = Logger.info.level;
  static set setLogLevel(int level) => _level = level;

  final int level;
  const Logger(
    this.level,
  );

  void log(Object message) {
    if (level >= Logger._level) {
      stdout.writeln(message.toString());
    }
  }
}
