import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import '../config/strings.dart';

class DecryptCommand extends Command {
  final ArgResults args;

  DecryptCommand(this.args);

  @override
  String get name => Strings.decryptName;

  @override
  String get description => Strings.decryptDesc;

  @override
  FutureOr? run() {
    print('run: $name');
  }
}
