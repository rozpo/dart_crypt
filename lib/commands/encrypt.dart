import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

import '../config/strings.dart';

class EncryptCommand extends Command {
  final ArgResults args;

  EncryptCommand(this.args);

  @override
  String get name => Strings.encryptName;

  @override
  String get description => Strings.encryptDesc;

  @override
  FutureOr? run() {
    print('run: $name');
  }
}
