import 'package:args/command_runner.dart';

import '../../utils/strings.dart';

abstract class EncryptionCommand extends Command {
  EncryptionCommand() {
    argParser.addOption(
      Strings.inputName,
      help: Strings.inputDesc,
      abbr: Strings.inputName[0],
      mandatory: true,
    );
  }

  @override
  String get category => 'Encryption';
}
