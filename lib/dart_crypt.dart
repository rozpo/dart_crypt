import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_completion/cli_completion.dart';

import 'commands/decrypt.dart';
import 'commands/encrypt.dart';
import 'config/strings.dart';

class DartCryptRunner extends CompletionCommandRunner {
  DartCryptRunner(super.executableName, super.description);
}

mixin DartCrypt {
  static CommandRunner runner = DartCryptRunner(
    Strings.binName,
    Strings.binDesc,
  );

  static late ArgResults args;

  static void init() {
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
  }

  static void parse(List<String> arguments) {
    args = runner.parse(arguments);
  }

  static void run(List<String> arguments) {
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
}
