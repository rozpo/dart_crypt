import 'dart:async';
import 'dart:io';

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
    String input = '';

    try {
      Uri path = Uri.parse(args[Strings.inputName]);
      input = File(path.path).readAsStringSync();
      input.trim();
    } catch (e) {
      if (e is FormatException || e is FileSystemException) {
        input = args[Strings.inputName];
      }
    }

    try {
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));

      final result = encrypter.decrypt(
        Encrypted.fromBase64(input),
        iv: iv,
      );

      try {
        if (args[Strings.outputName] != 'console') {
          Uri path = Uri.parse(args[Strings.outputName]);
          File(path.path).createSync();
          File(path.path).writeAsStringSync(result);
        } else {
          print(result);
        }
      } catch (e) {
        print('output error');
      }
    } catch (e) {
      print('$e');
    }
  }
}
