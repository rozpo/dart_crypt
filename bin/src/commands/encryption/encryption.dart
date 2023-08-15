import 'package:args/command_runner.dart';

import '../../utils/strings.dart';

abstract class EncryptionCommand extends Command {
  EncryptionCommand() {
    argParser.addOption(
      Strings.inputName,
      help: Strings.inputDesc,
      abbr: Strings.inputName[0],
      mandatory: true,
      allowedHelp: {
        Strings.inputStringKey: Strings.inputStringDesc,
        Strings.inputPathKey: Strings.inputPathDesc,
      },
      valueHelp: Strings.inputValue,
    );

    argParser.addOption(
      Strings.outputName,
      help: Strings.outputDesc,
      abbr: Strings.outputName[0],
      allowedHelp: {
        Strings.outputConsoleKey: Strings.outputConsoleDesc,
        Strings.outputPathKey: Strings.outputPathDesc,
      },
      defaultsTo: Strings.outputConsoleKey,
    );

    argParser.addOption(
      Strings.algorithmName,
      help: Strings.algorithmDesc,
      abbr: Strings.algorithmName[0],
      allowedHelp: {
        Strings.algorithmAesKey: Strings.algorithmAesDesc,
      },
      defaultsTo: Strings.algorithmAesKey,
    );

    argParser.addOption(
      Strings.keyName,
      help: Strings.keyDesc,
      abbr: Strings.keyName[0],
      valueHelp: Strings.keyValue,
    );

    argParser.addFlag(
      Strings.forceName,
      help: Strings.forceDesc,
      abbr: Strings.forceName[0],
      negatable: false,
    );
  }

  @override
  String get category => 'Encryption';
}
