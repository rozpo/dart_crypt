import 'package:cli_completion/cli_completion.dart';

import 'src/commands/commands.dart';
import 'src/utils/strings.dart';

void main(List<String> args) {
  Dcrypt().run(args);
}

class Dcrypt extends CompletionCommandRunner {
  Dcrypt()
      : super(
          Strings.binName,
          Strings.binDesc,
        ) {
    addCommand(DecryptCommand());
    addCommand(EncryptCommand());
  }
}
