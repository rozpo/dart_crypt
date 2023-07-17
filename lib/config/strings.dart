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
      'Specify the path to the file or enter the text.';
  static const String inputValue = 'data';
  static const String inputStringKey = '<string>';
  static const String inputStringDesc =
      'Raw data to be encrypted or decrypted.';
  static const String inputPathKey = '<path>';
  static const String inputPathDesc = 'File with data for operation.';

  // output option
  static const String outputName = 'output';
  static const String outputDesc =
      'Specify the output to store the command result.';
  static const String outputValue = 'path';
  static const String outputConsoleKey = 'console';
  static const String outputConsoleDesc = 'Print the output to the console.';
  static const String outputPathKey = '<path>';
  static const String outputPathDesc = 'Save the output to the target file.';

  // algorithm option
  static const String algorithmName = 'algorithm';
  static const String algorithmDesc =
      'Specify the encryption algorithm used during encryption (e.g., AES, RSA).';
  static const String algorithmValue = 'type';
  static const String algorithmAesKey = 'aes';
  static const String algorithmAesDesc =
      'Use the Advanced Encryption Standard (AES) algorithm.';

  // force flag
  static const String forceName = 'force';
  static const String forceDesc =
      'Force save to output, even if the target file exists.';

  // verbose flag
  static const String verboseName = 'verbose';
  static const String verboseDesc = 'Show additional command output.';

  // version flag
  static const String versionName = 'version';
  static const String versionDesc = 'Print the dcrypt version.';
}
