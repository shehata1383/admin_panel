import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'core/functions/notification_api.dart';
import 'core/helper/get_di.dart';
import 'my_app.dart';

void main() async {
  // Initialize controller
  // Initialize controller
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    size: Size(900, 600),
    minimumSize: Size(900, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  await Firebase.initializeApp();
  await NotificationApi.instance.initialize();
  await Get.putAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
    permanent: true,
  );
  await GetStorage.init();
  await init();
  runApp(MyApp());
}
