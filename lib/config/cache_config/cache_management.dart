import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_management/data/model/response_modal/user_detail_response.dart';

class CacheManagement {
  static Future<void> initHive() async {
    await Hive.initFlutter();
  }

  static void intialiseTypeAdapter() {
    Hive.registerAdapter(UserDetailResponseAdapter());
  }
}
