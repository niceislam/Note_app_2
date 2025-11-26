import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = FlutterSecureStorage();

  readData({required String key}) async {
    String? value = await storage.read(key: key);
    return value;
  }

  writeData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  deleteData({required String key}) async {
    await storage.delete(key: key);
  }

  deleteAll() async {
    await storage.deleteAll();
  }
}
