import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:convert/convert.dart';

class E2EEService {

  final X25519 _x25519 = Cryptography.instance.x25519();
  final AesGcm _aes = AesGcm.with256bits();

  late SimpleKeyPair? _keyPair;
  late String? publicKey;

  Future initAsync() async {
    _keyPair = await _x25519.newKeyPair();
    final publicKey = await _keyPair!.extractPublicKey();
    final publicKeyHex =  hex.encode(publicKey.bytes);
    this.publicKey = publicKeyHex;
  }

  Future<String> encryptMessageAsync(String message, String remotePublicKeyHex) async {
    final secretKey = await _getSharedKeyAsync(remotePublicKeyHex);

    final nonce = _aes.newNonce();

    final secretBox = await _aes.encrypt(
      utf8.encode(message),
      secretKey: secretKey,
      nonce: nonce,
    );

    final cipherTextHex = hex.encode(secretBox.cipherText);
    final nonceHex = hex.encode(secretBox.nonce);
    final macHex = hex.encode(secretBox.mac.bytes);

    return '$cipherTextHex.$nonceHex.$macHex';
  }

  Future<String> decrypMessageAsync(String message, String remotePublicKeyHex) async {
    final secretKey = await _getSharedKeyAsync(remotePublicKeyHex);

    final algorithm = AesGcm.with256bits();

    final parts = message.split('.');

    var cipherText = hex.decode(parts[0]);
    var nonce = hex.decode(parts[1]);
    var mac = Mac(hex.decode(parts[2]));

    final secretBox  = SecretBox(cipherText, nonce: nonce, mac: mac);

    final decryptedBytes = await algorithm.decrypt(secretBox, secretKey: secretKey);

    return utf8.decode(decryptedBytes);
  }

  Future<SecretKey> _getSharedKeyAsync(String remotePublicKeyHex) async {
    final remotePublicKey = SimplePublicKey(hex.decode(remotePublicKeyHex), type: KeyPairType.x25519);

    final secretKey = await _x25519.sharedSecretKey(keyPair: _keyPair!, remotePublicKey: remotePublicKey);
    
    return secretKey;
  }
}