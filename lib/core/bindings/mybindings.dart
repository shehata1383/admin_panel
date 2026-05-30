import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/auth/login.controller.dart';
import '../../controller/best_product/best_product_controller.dart';
import '../../controller/category/category_controller.dart';
import '../../controller/home_controller/home_controller.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
      permanent: true,
    );

    Get.lazyPut(() => LoginControllerImp(), fenix: true);

    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => BestProductControllerImp(), fenix: true);
    Get.lazyPut(() => CategoryControllerImp(), fenix: true);
  }
}
