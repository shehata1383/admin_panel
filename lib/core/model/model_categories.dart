import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String icon; // بافتراض أنها تُخزن كنص (String) في قاعدة البيانات
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  // دالة لتحويل البيانات القادمة من Firebase إلى كائن (Object)
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      // إذا كان الحقل icon يعود كمسار صورة نصي
      icon: map['icon']?.toString() ?? '',
      isActive: map['isActive'] ?? false,
      // تحويل Timestamp الخاص بفايربيز إلى DateTime الخاص بـ Dart
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  // دالة لتحويل الكائن إلى Map لإرساله أو تحديثه في Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isActive': isActive,
      // تحويل DateTime الخاص بـ Dart إلى Timestamp ليقبله فايربيز
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
