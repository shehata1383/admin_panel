import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../core/model/model_product.dart';

abstract class BestProductController extends GetxController {}

class BestProductControllerImp extends BestProductController {
  BestProductControllerImp();
  List<ProductModel> listBestProducts = [];

  @override
  void onInit() {
    getBestProducts();
    super.onInit();
  }

  Future<void> getBestProducts() async {
    // جلب البيانات من فايربيز
    final response = await FirebaseFirestore.instance
        .collection('products_pharmacy')
        .get();

    // تحويل البيانات (Snapshot) إلى قائمة من الـ Model
    listBestProducts = response.docs
        .where((doc) => doc.data()['isBestSell'] == true) // الفلترة أولاً
        .map((doc) => ProductModel.fromMap(doc.data())) // تحويل البيانات ثانياً
        .toList();
    // طباعة اسم أول عنصر للتأكد
    if (listBestProducts.isNotEmpty) {
      print('اسم القسم الأول: ${listBestProducts[0].productName}');
      print('تاريخ الإنشاء: ${listBestProducts[0].createdAt}');
    }

    update();
  }
}
