// lib/models/category.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class DataCategoryModel {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String color;
  final int order;
  final bool isActive;

  const DataCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.order,
    required this.isActive,
  });

  factory DataCategoryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DataCategoryModel(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      color: data['color'] ?? '#000000',
      order: data['order'] ?? 0,
      isActive: data['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'icon': icon,
      'color': color,
      'order': order,
      'isActive': isActive,
    };
  }
}
