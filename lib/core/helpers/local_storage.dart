

import 'package:localstorage/localstorage.dart';

class LocalStorageController {
    final LocalStorage storage = LocalStorage("Doctors");
    dynamic getFromStorage(String title) async {
    await storage.ready;
    return await storage.getItem(title);
  }

  void clearStorage(Function function) async {
    await storage.clear();
    function();
  }

  Future<void> saveObjectToStorage(String title, dynamic object) async {
    await storage.ready;
    return storage.setItem(title, object);
  }

}