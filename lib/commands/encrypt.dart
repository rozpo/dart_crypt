import 'package:args/command_runner.dart';

import '../config/strings.dart';

class EncryptCommand extends Command {
  @override
  String get name => Strings.encryptName;

  @override
  String get description => Strings.encryptDesc;
}
