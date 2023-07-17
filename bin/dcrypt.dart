import 'package:dart_crypt/dart_crypt.dart';

void main(List<String> arguments) {
  DartCrypt.init();
  DartCrypt.parse(arguments);
  DartCrypt.run(arguments);
}
