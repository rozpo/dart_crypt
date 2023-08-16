import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../../utils/logger.dart';

class GitChannelCommand extends Command {
  @override
  String get name => 'git';

  @override
  String get description => 'Set channel to git repository.';

  @override
  FutureOr? run() {
    String path = 'https://github.com/rozpo/dart_crypt';

    var cmd = Process.runSync(
      'dart',
      [
        'pub',
        'global',
        'activate',
        '--source',
        'git',
        path,
      ],
    );

    if (cmd.exitCode == 0) {
      Logger.info.log('Channel set to $path');
    } else {
      Logger.error.log(cmd.stderr);
    }
  }
}
