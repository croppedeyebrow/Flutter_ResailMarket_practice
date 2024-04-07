//스토리지에 데이터를 저장하고 불러오는 역할을 하는 LocalStorageRepository 클래스를 만들어보겠습니다.
//contentrepository에서 여기로 접근.
//스토리지에 저장되는 것은 무조건 String값.
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageRepositoy {
  final storage = new FlutterSecureStorage();

  Future<String> getStoredValue(String key) async {
    try {
      return await storage.read(key: key) ?? "";
    } catch (e) {
      return "";
    }
  }

//key를 통해 저장하고 value를 통해 값을 받아옵니다.
  Future<void> storedValue(String key, String value) async {
    try {
      await storage.write(key: key, value: value.toString());
    } catch (e) {
      return null;
    }
  }
}
