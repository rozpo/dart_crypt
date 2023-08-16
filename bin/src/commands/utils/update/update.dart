import 'dart:async';
import 'dart:io';

import '../../../utils/logger.dart';
import '../../../utils/strings.dart';
import '../utils.dart';

class UpdateCommand extends UtilsCommand {
  @override
  String get name => 'update';

  @override
  String get description => 'Update ${Strings.binName} to the latest version';

  @override
  FutureOr? run() {
    var cmd = Process.runSync(
        'dart', ['pub', 'global', 'activate', '--source', 'path', '.']);

    if (cmd.exitCode == 0) {
      Logger.info.log(cmd.stdout);
    } else {
      Logger.error.log(cmd.stderr);
    }
  }
}
