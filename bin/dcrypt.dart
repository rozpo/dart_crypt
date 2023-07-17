import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_crypt/commands/decrypt.dart';
import 'package:dart_crypt/commands/encrypt.dart';
import 'package:dart_crypt/config/strings.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    Strings.binName,
    Strings.binDesc,
  );

  final args = runner.parse(arguments);

  runner.addCommand(EncryptCommand(args));
  runner.addCommand(DecryptCommand(args));

  runner.run(arguments).catchError(
    (error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    },
  );
}
