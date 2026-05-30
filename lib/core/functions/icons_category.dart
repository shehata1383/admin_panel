// إنشاء Map للربط بين النصوص والأيقونات
import 'package:flutter/material.dart';

final Map<String, IconData> iconMap = {
  'Icons.medication': Icons.medication,
  'Icons.spa': Icons.spa,
  'Icons.face': Icons.face,
  'Icons.child_care': Icons.child_care,
  'Icons.medical_services': Icons.medical_services,
  'Icons.monitor_heart': Icons.monitor_heart,
  'Icons.local_florist': Icons.local_florist,
  'Icons.brush': Icons.brush,
  'Icons.content_cut': Icons.content_cut,
  'Icons.visibility': Icons.visibility,
  'Icons.hearing': Icons.hearing,
  'Icons.fitness_center': Icons.fitness_center,
  'Icons.sports_gymnastics': Icons.sports_gymnastics,
  'Icons.eco': Icons.eco,
  'Icons.pregnant_woman': Icons.pregnant_woman,
  'Icons.accessibility_new': Icons.accessibility_new,
  'Icons.favorite': Icons.favorite,
  'Icons.cleaning_services': Icons.cleaning_services,
  'Icons.wb_sunny': Icons.wb_sunny,
  'Icons.smoke_free': Icons.smoke_free,
};

// دالة للتحويل
IconData getIconFromString(String iconName) {
  return iconMap[iconName] ?? Icons.category; // أيقونة افتراضية
}

// // الاستخدام
// Icon(
//   getIconFromString(category['icon'] as String),
//   size: 48,
//   color: Color(int.parse(category['color'].toString().substring(1), radix: 16) + 0xFF000000),
// );
