# Dcrypt

## Introduction

Dcrypt is a command-line interface (CLI) application that provides encryption and decryption capabilities for your sensitive data. With Dcrypt, you can easily encrypt your data to protect it from unauthorized access, and decrypt it when needed.

## Installation

To install Dcrypt, follow these steps:

```
dart pub global activate --source git https://github.com/rozpo/dart_crypt
```

Then, verify installation by:

```
dcrypt
```

The output should be something like this:

```
> dcrypt
Command-line interface application that provides encryption and decryption capabilities for your sensitive data.

Usage: dcrypt <command> [arguments]

Global options:
-h, --help                        Print this usage information.
-k, --key=<key> (mandatory)       Provide the secret key used during encryption.
-i, --input=<data> (mandatory)    Specify the path to the file or enter the text.

          [<path>]                File with data for operation.
          [<string>]              Raw data to be encrypted or decrypted.

-o, --output=<path>               Specify the output to store the command result.

          [<path>]                Save the output to the target file.
          [console] (default)     Print the output to the console.

-a, --algorithm=<type>            Specify the encryption algorithm used during encryption (e.g., AES, RSA).

          [aes] (default)         Use the Advanced Encryption Standard (AES) algorithm.

-f, --force                       Force save to output, even if the target file exists.
-v, --verbose                     Show additional command output.
    --version                     Print the dcrypt version.

Available commands:
  decrypt   Decrypt previously encrypted data using the same encryption algorithm and secret key.
  encrypt   Encrypt your sensitive data using a specified encryption algorithm and a secret key.

Run "dcrypt help <command>" for more information about a command.
```

## Usage

Dcrypt provides two main commands: **encrypt** and **decrypt**. Commands can be used interchangeably with global options and flags:


### Basic usage

This example will encrypt raw string data and print result to the console:

```
dcrypt encrypt --key "my_secret_key" --input "data_to_be_encrypted"
```

### Working with files

On this example encrypted data for decryption will be get from file and result of the operation will be saved into another file:

```
dcrypt decrypt --key "my_secret_key" --input /path/to/file.txt --output /file/where/save/encrypted/data
```

## Security Considerations

- **Keep your secret key safe**: The security of the encrypted data depends on the secrecy of the key. Make sure to choose a strong and secure key and keep it confidential.

- **Protect the encrypted data**: Store the encrypted data securely to prevent unauthorized access. Use appropriate file permissions and encryption at rest techniques to safeguard the encrypted files.

- **Verify data integrity**: Dcrypt focuses on encryption and decryption, but it doesn't guarantee data integrity. It is recommended to use cryptographic hash functions or other integrity verification mechanisms for critical data.

## Contributions and Issue Reporting

Contributions to Dcrypt are welcome! If you find any issues or have suggestions for improvements, please open an issue on the [Dcrypt GitHub repository](https://github.com/rozpo/dart_crypt).

## License

Dcrypt is open-source software released under the [MIT License](https://opensource.org/license/mit/). Please see the [LICENSE](LICENSE) file for more details.

## Acknowledgments

Dcrypt makes use of various cryptographic libraries and algorithms. Special thanks to the authors and contributors of these libraries for their valuable work.

## Disclaimer

Dcrypt should be used responsibly and in compliance with applicable laws and regulations. The developers are not responsible for any misuse or unlawful activities performed using this application.
