import 'dart:async';
import 'dart:io';

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
    String input = '';

    try {
      Uri path = Uri.parse(args[Strings.inputName]);
      input = File(path.path).readAsStringSync();
    } catch (e) {
      if (e is FormatException || e is FileSystemException) {
        input = args[Strings.inputName];
      }
    }

    try {
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));

      final result = encrypter.encrypt(input, iv: iv);

      try {
        if (args[Strings.outputName] != 'console') {
          Uri path = Uri.parse(args[Strings.outputName]);
          File(path.path).createSync();
          File(path.path).writeAsStringSync(result.base64);
        } else {
          print(result.base64);
        }
      } catch (e) {
        print('output error');
      }
    } catch (e) {
      print('$e');
    }
  }
}
