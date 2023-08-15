import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import '../utils.dart';

class KeygenCommand extends UtilsCommand {
  @override
  String get name => 'keygen';

  @override
  String get description => 'Generate random key for encryption.';

  @override
  FutureOr? run() {
    print(
      base64.encode(
        Uint8List.fromList(
          List.generate(32, (index) => Random().nextInt(256)),
        ),
      ),
    );
  }
}
