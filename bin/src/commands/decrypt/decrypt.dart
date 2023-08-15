import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:args/command_runner.dart';
import 'package:encrypt/encrypt.dart';

import '../../utils/strings.dart';

class DecryptCommand extends Command {
  @override
  String get name => Strings.decryptName;

  @override
  String get description => Strings.decryptDesc;

  @override
  FutureOr? run() {
    late List<int> result;

    try {
      Uri file = Uri.parse(argResults![Strings.inputName]);
      Uint8List content = File(file.path).readAsBytesSync();

      final encrypter =
          Encrypter(AES(Key.fromUtf8(argResults![Strings.keyName])));
      result =
          encrypter.decryptBytes(Encrypted(content), iv: IV.fromLength(16));
    } catch (e) {
      if (e is FormatException || e is FileSystemException) {
        String input = argResults![Strings.inputName];

        final encrypter =
            Encrypter(AES(Key.fromUtf8(argResults![Strings.keyName])));
        result = encrypter.decryptBytes(Encrypted.fromBase64(input),
            iv: IV.fromLength(16));
      } else {
        print(e);
      }
    } finally {
      if (argResults![Strings.outputName] != 'console') {
        Uri file = Uri.parse(argResults![Strings.outputName]);
        File(file.path).createSync();
        File(file.path).writeAsBytesSync(result);
      } else {
        print(String.fromCharCodes(result));
      }
    }
  }
}
