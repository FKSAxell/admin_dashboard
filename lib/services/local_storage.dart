import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static late GetStorage storage;

  static Future<void> configureStorage() async {
    await GetStorage.init();
    storage = GetStorage();
  }
}
