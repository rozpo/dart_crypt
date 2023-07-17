import 'package:args/command_runner.dart';

import '../config/strings.dart';

class DecryptCommand extends Command {
  @override
  String get name => Strings.decryptName;

  @override
  String get description => Strings.decryptDesc;
}
