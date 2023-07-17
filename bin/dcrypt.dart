import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'dcrypt',
    'My encryption tool written in dart language',
  );

  runner.run(arguments);
}
