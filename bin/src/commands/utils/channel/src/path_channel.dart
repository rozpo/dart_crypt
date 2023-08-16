import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../../utils/logger.dart';

class PathChannelCommand extends Command {
  @override
  String get name => 'path';

  @override
  String get description => 'Set channel to custom path.';

  PathChannelCommand() {
    argParser.addOption('source',
        abbr: 's', defaultsTo: '.', valueHelp: 'path', help: 'Path to source.');
  }

  @override
  FutureOr? run() {
    String path = argResults!['source'];

    var cmd = Process.runSync(
        'dart', ['pub', 'global', 'activate', '--source', 'path', path]);

    if (cmd.exitCode == 0) {
      Logger.info.log('Channel set to $path');
    } else {
      Logger.error.log('Unable to set channel to $path');
    }
  }
}
