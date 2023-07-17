mixin Strings {
  static const String binName = 'dcrypt';
  static const String binDesc =
      'Command-line interface application that provides encryption and decryption capabilities for your sensitive data.';

  // encrypt command
  static const String encryptName = 'encrypt';
  static const String encryptDesc =
      'Encrypt your sensitive data using a specified encryption algorithm and a secret key.';

  // decrypt command
  static const String decryptName = 'decrypt';
  static const String decryptDesc =
      'Decrypt previously encrypted data using the same encryption algorithm and secret key.';

  // key option
  static const String keyName = 'key';
  static const String keyDesc =
      'Provide the secret key used during encryption.';
  static const String keyValue = 'key';

  // input option
  static const String inputName = 'input';
  static const String inputDesc =
      'Specify the path to the encrypted file or enter the encrypted text.';
  static const String inputValue = 'data';

  // output option
  static const String outputName = 'output';
  static const String outputDesc =
      'Specify the output file path to store the decrypted data.';
  static const String outputValue = 'path';

  // verbose option
  static const String verboseName = 'verbose';
  static const String verboseDesc = 'Show additional command output.';

  // version option
  static const String versionName = 'version';
  static const String versionDesc = 'Print the dcrypt version.';
}
