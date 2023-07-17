mixin Strings {
  static const String binName = 'dcrypt';
  static const String binDesc =
      'Command-line interface application that provides encryption and decryption capabilities for your sensitive data';

  // encrypt command
  static const String encryptName = 'encrypt';
  static const String encryptDesc =
      'Encrypt your sensitive data using a specified encryption algorithm and a secret key';

  // decrypt command
  static const String decryptName = 'decrypt';
  static const String decryptDesc =
      'Decrypt previously encrypted data using the same encryption algorithm and secret key';
}
