import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import '../../../utils/logger.dart';
import '../utils.dart';

class KeygenCommand extends UtilsCommand {
  @override
  String get name => 'keygen';

  @override
  String get description => 'Generate random key for encryption.';

  KeygenCommand() {
    argParser.addOption(
      'length',
      help: 'Requested length of the key.',
      abbr: 'l',
      defaultsTo: '32',
    );

    argParser.addOption(
      'output',
      help: 'Specify the output for the keygen command result.',
      abbr: 'o',
      valueHelp: 'path',
      allowedHelp: {
        '<path>': 'Save the output to the target file.',
        'console': 'Print the output to the console.'
      },
      defaultsTo: 'console',
    );

    argParser.addFlag(
      'force',
      help: 'Force save to output, even if the target file exists.',
      abbr: 'f',
      negatable: false,
    );
  }

  // ====================
  // COMMAND LOGIC
  // ====================
  @override
  FutureOr? run() {
    Random random = Random();
    int length = _getLengthFromArgs();
    int range = 256;

    Uint8List uint8list = Uint8List.fromList(
      List.generate(length, (index) => random.nextInt(range)),
    );

    String msg = base64.encode(uint8list);

    if (_shouldSaveKeyToFile()) {
      _saveKeyToFile();
    } else {
      Logger.info.log(msg);
    }
  }

  // ====================
  // INTERNAL METHODS
  // ====================
  int _getLengthFromArgs() {
    int defaultLength = 32;
    int result = defaultLength;

    if (argResults!.wasParsed('length')) {
      result = int.tryParse(argResults!['length']) ?? defaultLength;
    }

    Logger.debug.log('Key value set to: $result');
    return result;
  }

  bool _shouldSaveKeyToFile() {
    return argResults!.wasParsed('output');
  }

  bool _saveKeyToFile() {
    bool result = false;
    return result;
  }
}
