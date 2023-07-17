import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:encrypt/encrypt.dart';

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
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));
    final result = encrypter.encrypt(args[Strings.inputName], iv: iv);

    print(result.base64);
  }
}
