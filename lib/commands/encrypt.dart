import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

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
    late Encrypted result;

    try {
      Uri file = Uri.parse(args[Strings.inputName]);
      Uint8List content = File(file.path).readAsBytesSync();

      final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));
      result = encrypter.encryptBytes(content, iv: IV.fromLength(16));
    } catch (e) {
      if (e is FormatException || e is FileSystemException) {
        String input = args[Strings.inputName];

        final encrypter = Encrypter(AES(Key.fromUtf8(args[Strings.keyName])));
        result = encrypter.encrypt(input, iv: IV.fromLength(16));
      } else {
        print(e);
      }
    } finally {
      if (args[Strings.outputName] != 'console') {
        Uri file = Uri.parse(args[Strings.outputName]);
        File(file.path).createSync();
        File(file.path).writeAsBytesSync(result.bytes);
      } else {
        print(result.base64);
      }
    }
  }
}
