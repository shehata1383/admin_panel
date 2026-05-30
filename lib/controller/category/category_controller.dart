import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../core/model/model_product.dart';

abstract class CategoryController extends GetxController {}

class CategoryControllerImp extends CategoryController {
  CategoryControllerImp();
  List<ProductModel> listProductsCategory = [];
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getProductsCategory({required String categoryId}) async {
    // جلب البيانات من فايربيز
    final response = await FirebaseFirestore.instance
        .collection('products_pharmacy')
        .get();

    // تحويل البيانات (Snapshot) إلى قائمة من الـ Model
    listProductsCategory = response.docs
        .where((doc) => doc.data()['categoryId'] == categoryId)
        .map((doc) {
          return ProductModel.fromMap(doc.data());
        }) // تحويل البيانات ثانياً
        .toList();
    // طباعة اسم أول عنصر للتأكد
    if (listProductsCategory.isNotEmpty) {
      print('اسم القسم الأول: ${listProductsCategory[0].productName}');
      print('تاريخ الإنشاء: ${listProductsCategory[0].createdAt}');
    }

    update();
  }
}
