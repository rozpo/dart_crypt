import 'dart:io';

import '../utils/strings.dart';

mixin Version {
  static String _fetchInfo() {
    String result = '';

    var cmd = Process.runSync('dart', ['pub', 'global', 'list']);
    List<String> packages = cmd.stdout.split('\n');

    for (var package in packages) {
      if (package.contains('dart_crypt')) {
        result = package;
        break;
      }
    }

    return result;
  }

  static void printVersion() {
    stdout.writeln(_fetchInfo());
    stdout.writeln('Copyright (C) 2023 Piotr Rozponczyk');
    stdout.writeln('MIT License');
  }
}
