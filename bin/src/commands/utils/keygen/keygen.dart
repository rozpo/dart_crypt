import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:errno/errno.dart';

import '../../../utils/logger.dart';
import '../utils.dart';

class KeygenCommand extends UtilsCommand {
  static const String _length = 'length';
  static const String _output = 'output';
  static const String _force = 'force';

  @override
  String get name => 'keygen';

  @override
  String get description => 'Generate random key for encryption.';

  KeygenCommand() {
    argParser.addOption(
      _length,
      abbr: _length[0],
      help: 'Requested length of the key.',
      defaultsTo: '32',
    );

    argParser.addOption(
      _output,
      abbr: _output[0],
      help: 'Specify the output for the keygen command result.',
      valueHelp: 'path',
      allowedHelp: {
        '<path>': 'Save the output to the target file.',
        'console': 'Print the output to the console.'
      },
      defaultsTo: 'console',
    );

    argParser.addFlag(
      _force,
      abbr: _force[0],
      help: 'Force save to output, even if the target file exists.',
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
  bool _shouldSaveKeyToFile() => argResults!.wasParsed(_output);
  bool _canOverrideFile() => argResults!.wasParsed(_force);
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

    if (argResults!.wasParsed(_length)) {
      try {
        result = int.parse(argResults![_length]);
      } on FormatException {
        Logger.error.log('Invalid key length');
        exit(LinuxErrors.invalidArgument);
      }
    }

    Logger.debug.log('Key value set to: $result');
    return result;
  }

  void _saveKeyToFile(String msg) {
    File file = File(argResults![_output]);

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
