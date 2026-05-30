import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String idProduct;
  final String idPharmacy;
  final String productName;
  final String searchName; // حقل البحث الذكي لمنع مشاكل الحروف الكبيرة والصغيرة
  final String categoryName;
  final String categoryId; // معرّف الصنف لتسهيل الفلترة السريعة
  final String productImage;
  final String pharmacyId;
  final String pharmacyName;
  final String dosageForm; // الحقل الجديد: الشكل الدوائي (أقراص، شراب، إلخ)
  final int stock;
  int count;
  final double price;
  final String productDes;
  final bool isBestSell;
  final bool requiresPrescription;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.idProduct,
    required this.idPharmacy,
    required this.productName,
    required this.searchName,
    required this.categoryName,
    required this.categoryId,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.productImage,
    required this.dosageForm,
    required this.stock,
    required this.price,
    required this.productDes,
    required this.isBestSell,
    required this.requiresPrescription,
    required this.createdAt,
    required this.updatedAt,
    this.count = 1,
  });

  // =========================================================================
  // 1. التعامل مع الفايرستور (تحويل الـ Timestamp تلقائياً)
  // =========================================================================
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      idProduct: map['id_product'] ?? '',
      idPharmacy: map['id_pharmacy'] ?? '',
      productName: map['productName'] ?? '',
      searchName: map['searchName'] ?? '', // جلب حقل البحث
      categoryName: map['categoryName'] ?? '',
      categoryId: map['categoryId'] ?? '', // جلب معرّف الصنف المنسي سابقاً
      pharmacyId: map['pharmacyId'] ?? '',
      pharmacyName: map['pharmacy_name'] ?? map['pharmacyName'] ?? '',
      productImage: map['productImage'] ?? '',
      productDes: map['productDes'] ?? '',
      dosageForm: map['dosageForm'] ?? '', // جلب الحقل الجديد
      stock: (map['stock'] ?? 0) as int,
      price: (map['price'] ?? 0.0).toDouble(),
      isBestSell: map['isBestSell'] ?? false,
      requiresPrescription: map['requiresPrescription'] ?? false,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_product': idProduct,
      'id_pharmacy': idPharmacy,
      'productName': productName,
      'searchName': productName.toLowerCase().trim(), // حفظ تلقائي بحروف صغيرة
      'pharmacyId': pharmacyId,
      'pharmacy_name': pharmacyName,
      'categoryName': categoryName,
      'categoryId': categoryId, // حفظ معرّف الصنف للفايرستور
      'productImage': productImage,
      'dosageForm': dosageForm, // حفظ الشكل الدوائي للفايرستور
      'stock': stock,
      'price': price,
      'productDes': productDes,
      'isBestSell': isBestSell,
      'requiresPrescription': requiresPrescription,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // =========================================================================
  // 2. التعامل مع التخزين المحلي GetStorage (تحويل الـ ISO String للتواريخ)
  // =========================================================================
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      idProduct: map['id_product'] ?? '',
      idPharmacy: map['id_pharmacy'] ?? '',
      productName: map['productName'] ?? '',
      searchName: map['searchName'] ?? '',
      categoryName: map['categoryName'] ?? '',
      categoryId: map['categoryId'] ?? '',
      pharmacyId: map['pharmacyId'] ?? '',
      pharmacyName: map['pharmacy_name'] ?? '',
      productImage: map['productImage'] ?? '',
      productDes: map['productDes'] ?? '',
      dosageForm: map['dosageForm'] ?? '',
      stock: (map['stock'] ?? 0) as int,
      price: (map['price'] ?? 0.0).toDouble(),
      count: map['count'] ?? 1,
      isBestSell: map['isBestSell'] ?? false,
      requiresPrescription: map['requiresPrescription'] ?? false,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_product': idProduct,
      'id_pharmacy': idPharmacy,
      'productName': productName,
      'searchName': searchName,
      'pharmacyId': pharmacyId,
      'pharmacy_name': pharmacyName,
      'categoryName': categoryName,
      'categoryId': categoryId, // حفظ معرّف الصنف محلياً
      'productImage': productImage,
      'dosageForm': dosageForm, // حفظ الشكل الدوائي محلياً
      'stock': stock,
      'price': price,
      'count': count,
      'productDes': productDes,
      'isBestSell': isBestSell,
      'requiresPrescription': requiresPrescription,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
