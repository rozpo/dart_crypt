import 'dart:async';
import 'dart:convert';
import 'dart:io';
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
    String msg = _generateKey();

    if (_shouldSaveKeyToFile()) {
      _saveKeyToFile(msg);
    } else {
      Logger.info.log(msg);
    }
  }

  // ====================
  // INTERNAL METHODS
  // ====================
  String _generateKey() {
    Random random = Random();
    int length = _getLengthFromArgs();
    int range = 256;

    Uint8List uint8list = Uint8List.fromList(
      List.generate(length, (index) => random.nextInt(range)),
    );

    return base64.encode(uint8list);
  }

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

  void _saveKeyToFile(String msg) {
    File file = File(argResults!['output']);

    if (!file.existsSync() || _canOverrideFile()) {
      try {
        file.writeAsStringSync(msg);
        Logger.info.log('Key saved to ${file.path}');
      } on FileSystemException {
        Logger.error.log('Save failed');
      }
    } else {
      Logger.warning.log('File exists, use --force to override.');
    }
  }

  bool _canOverrideFile() {
    return argResults!.wasParsed('force');
  }
}
