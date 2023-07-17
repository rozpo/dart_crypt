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

  runner.argParser.addOption(
    Strings.keyName,
    abbr: Strings.keyName[0],
    help: Strings.keyDesc,
    valueHelp: Strings.keyValue,
  );

  runner.argParser.addOption(
    Strings.inputName,
    abbr: Strings.inputName[0],
    help: Strings.inputDesc,
    valueHelp: Strings.inputValue,
  );

  runner.argParser.addOption(
    Strings.outputName,
    abbr: Strings.outputName[0],
    help: Strings.outputDesc,
    valueHelp: Strings.outputValue,
  );

  runner.argParser.addOption(
    Strings.verboseName,
    abbr: Strings.verboseName[0],
    help: Strings.verboseDesc,
  );

   runner.argParser.addOption(
    Strings.versionName,
    help: Strings.versionDesc,
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
