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
      mandatory: true,
    );

    runner.argParser.addOption(
      Strings.inputName,
      abbr: Strings.inputName[0],
      help: Strings.inputDesc,
      valueHelp: Strings.inputValue,
      allowedHelp: {
        Strings.inputStringKey: Strings.inputStringDesc,
        // TODO Missing implementation
        // Strings.inputPathKey: Strings.inputPathDesc,
      },
      mandatory: true,
    );

    // TODO Missing implementation
    // runner.argParser.addOption(
    //   Strings.outputName,
    //   abbr: Strings.outputName[0],
    //   help: Strings.outputDesc,
    //   valueHelp: Strings.outputValue,
    //   allowedHelp: {
    //     Strings.outputConsoleKey: Strings.outputConsoleDesc,
    //     Strings.outputPathKey: Strings.outputPathDesc,
    //   },
    //   defaultsTo: Strings.outputConsoleKey,
    // );

    // TODO Missing implementation
    // runner.argParser.addOption(
    //   Strings.algorithmName,
    //   abbr: Strings.algorithmName[0],
    //   help: Strings.algorithmDesc,
    //   valueHelp: Strings.algorithmValue,
    //   allowed: [
    //     Strings.algorithmAesKey,
    //   ],
    //   allowedHelp: {
    //     Strings.algorithmAesKey: Strings.algorithmAesDesc,
    //   },
    //   defaultsTo: Strings.algorithmAesKey,
    // );

    // TODO Missing implementation
    // runner.argParser.addFlag(
    //   Strings.forceName,
    //   abbr: Strings.forceName[0],
    //   help: Strings.forceDesc,
    //   negatable: false,
    // );

    // TODO Missing implementation
    // runner.argParser.addFlag(
    //   Strings.verboseName,
    //   abbr: Strings.verboseName[0],
    //   help: Strings.verboseDesc,
    //   negatable: false,
    // );

    // TODO Missing implementation
    // runner.argParser.addFlag(
    //   Strings.versionName,
    //   help: Strings.versionDesc,
    //   negatable: false,
    // );
  }

  static void parse(List<String> arguments) {
    try {
      args = runner.parse(arguments);
    } catch (e) {
      print(e);
      exit(64);
    }
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
