import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

final secureStorage = const FlutterSecureStorage();

Future<Box> openEncryptedBox<T>(String boxName) async {
  var encryptionKey = await secureStorage.read(key: 'hive_key');
  if (encryptionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(key: 'hive_key', value: base64UrlEncode(key));
    encryptionKey = base64UrlEncode(key);
  }

  return Hive.openBox<T>(
    boxName,
    encryptionCipher: HiveAesCipher(base64Url.decode(encryptionKey)),
  );
}
