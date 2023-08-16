import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import '../../../utils/strings.dart';
import '../encryption.dart';

class EncryptCommand extends EncryptionCommand {
  @override
  String get name => Strings.encryptName;

  @override
  String get description => Strings.encryptDesc;

  @override
  List<String> get aliases => ['e', 'en', 'enc'];

  @override
  FutureOr? run() {
    late Encrypted result;

    try {
      Uri file = Uri.parse(argResults![Strings.inputName]);
      Uint8List content = File(file.path).readAsBytesSync();

      final encrypter =
          Encrypter(AES(Key.fromBase64(argResults![Strings.keyName])));
      result = encrypter.encryptBytes(content, iv: IV.fromLength(16));
    } catch (e) {
      if (e is FormatException || e is FileSystemException) {
        String input = argResults![Strings.inputName];

        final encrypter =
            Encrypter(AES(Key.fromBase64(argResults![Strings.keyName])));
        result = encrypter.encrypt(input, iv: IV.fromLength(16));
      } else {
        print(e);
      }
    } finally {
      if (argResults![Strings.outputName] != 'console') {
        Uri file = Uri.parse(argResults![Strings.outputName]);
        File(file.path).createSync();
        File(file.path).writeAsBytesSync(result.bytes);
      } else {
        print(result.base64);
      }
    }
  }
}
