import 'dart:io';

import 'package:args/src/arg_results.dart';
import 'package:cli_completion/cli_completion.dart';

import 'src/commands/commands.dart';
import 'src/globals/version.dart';
import 'src/utils/strings.dart';

void main(List<String> args) {
  Dcrypt().run(args);
}

class Dcrypt extends CompletionCommandRunner {
  Dcrypt() : super(Strings.binName, Strings.binDesc) {
    _loadCommands();
    _loadGlobals();
  }

  void _loadCommands() {
    addCommand(DecryptCommand());
    addCommand(EncryptCommand());
  }

  void _loadGlobals() {
    argParser.addFlag(
      Strings.verboseName,
      help: Strings.verboseDesc,
      abbr: Strings.verboseName[0],
      negatable: false,
    );

    argParser.addFlag(
      Strings.versionName,
      help: Strings.versionDesc,
      negatable: false,
    );
  }

  @override
  ArgResults parse(Iterable<String> args) {
    for (var element in args) {
      if (element == '--version') {
        Version.printVersion();
        exit(0);
      }
    }

    return super.parse(args);
  }
}
