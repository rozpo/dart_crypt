import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:encrypt/encrypt.dart';

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
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));

    final result = encrypter.decrypt(
      Encrypted.fromBase64(args[Strings.inputName]),
      iv: iv,
    );

    print(result);
  }
}
