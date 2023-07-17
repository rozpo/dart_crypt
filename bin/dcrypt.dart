import 'package:args/command_runner.dart';
import 'package:dart_crypt/commands/decrypt.dart';
import 'package:dart_crypt/commands/encrypt.dart';
import 'package:dart_crypt/config/strings.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    Strings.binName,
    Strings.binDesc,
  );

  runner.addCommand(EncryptCommand());
  runner.addCommand(DecryptCommand());

  runner.run(arguments);
}
