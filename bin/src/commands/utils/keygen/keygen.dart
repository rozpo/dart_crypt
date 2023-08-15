import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:errno/errno.dart';

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
      _printKeyToConsole(msg);
    }
  }

  // ====================
  // INTERNAL METHODS
  // ====================
  bool _shouldSaveKeyToFile() => argResults!.wasParsed('output');
  bool _canOverrideFile() => argResults!.wasParsed('force');
  void _printKeyToConsole(String msg) => Logger.info.log(msg);

  String _generateKey() {
    Random random = Random();
    int length = _parseKeyLength();
    int range = 256;

    Uint8List uint8list = Uint8List.fromList(
      List.generate(length, (index) => random.nextInt(range)),
    );

    return base64.encode(uint8list);
  }

  int _parseKeyLength() {
    int defaultLength = 32;
    int result = defaultLength;

    if (argResults!.wasParsed('length')) {
      try {
        result = int.parse(argResults!['length']);
      } on FormatException {
        Logger.error.log('Invalid key length');
        exit(LinuxErrors.invalidArgument);
      }
    }

    Logger.debug.log('Key value set to: $result');
    return result;
  }

  void _saveKeyToFile(String msg) {
    File file = File(argResults!['output']);

    // File not exists or --force flag is present
    if (!file.existsSync() || _canOverrideFile()) {
      try {
        file.writeAsStringSync(msg);
        Logger.info.log('Key saved to ${file.path}');
      } on FileSystemException {
        Logger.error.log('Save to file failed');
        exit(LinuxErrors.readOnlyFileSystem);
      }
    } else {
      Logger.warning.log('File exists, use --force to override.');
      exit(LinuxErrors.fileExists);
    }
  }
}
