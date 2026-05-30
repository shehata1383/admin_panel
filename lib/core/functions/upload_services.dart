// lib/services/upload_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class UploadService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // بيانات التصنيفات
  // استيراد البيانات من JSON
  List<Map<String, Object>> categories = [
    {
      "name": "صيدلية 19011",
      "address": "9 شارع طلعت حرب، وسط البلد، القاهرة",
      "latitude": 30.0444,
      "longitude": 31.2357,
      "phone": "0223920000",
      "email": "info@19011.com.eg",
      "licenseNumber": "EG-12345",
      "isActive": true,
      "rating": 4.5,
      "totalReviews": 1250,
      "deliveryAvailable": true,
      "deliveryFee": 15,
      "minOrderAmount": 50,
      "workingHours": {
        "sunday": "08:00-22:00",
        "monday": "08:00-22:00",
        "tuesday": "08:00-22:00",
        "wednesday": "08:00-22:00",
        "thursday": "08:00-22:00",
        "friday": "08:00-22:00",
        "saturday": "08:00-22:00",
      },
    },
    {
      "name": "صيدلية النهضة",
      "address": "123 كورنيش النيل، جاردن سيتي، القاهرة",
      "latitude": 30.0492,
      "longitude": 31.2426,
      "phone": "0227910000",
      "email": "nahda@pharmacy.com.eg",
      "licenseNumber": "EG-23456",
      "isActive": true,
      "rating": 4.3,
      "totalReviews": 890,
      "deliveryAvailable": true,
      "deliveryFee": 20,
      "minOrderAmount": 75,
      "workingHours": {
        "sunday": "24:00",
        "monday": "24:00",
        "tuesday": "24:00",
        "wednesday": "24:00",
        "thursday": "24:00",
        "friday": "24:00",
        "saturday": "24:00",
      },
    },
    {
      "name": "صيدلية الرحمة",
      "address": "45 شارع الحرية، العجمي، الإسكندرية",
      "latitude": 31.2058,
      "longitude": 29.9244,
      "phone": "0342910000",
      "email": "rahma@alex-pharmacy.com",
      "licenseNumber": "EG-34567",
      "isActive": true,
      "rating": 4.7,
      "totalReviews": 1560,
      "deliveryAvailable": true,
      "deliveryFee": 12,
      "minOrderAmount": 40,
      "workingHours": {
        "sunday": "07:00-23:00",
        "monday": "07:00-23:00",
        "tuesday": "07:00-23:00",
        "wednesday": "07:00-23:00",
        "thursday": "07:00-23:00",
        "friday": "07:00-23:00",
        "saturday": "07:00-23:00",
      },
    },
    {
      "name": "صيدلية الصحة",
      "address": "156 شارع الجيزة، أمام مستشفى الجيزة، الجيزة",
      "latitude": 30.0081,
      "longitude": 31.2109,
      "phone": "0235680000",
      "email": "seha@giza-pharmacy.com",
      "licenseNumber": "EG-56789",
      "isActive": true,
      "rating": 4.1,
      "totalReviews": 670,
      "deliveryAvailable": false,
      "deliveryFee": 0,
      "minOrderAmount": 0,
      "workingHours": {
        "sunday": "08:30-21:30",
        "monday": "08:30-21:30",
        "tuesday": "08:30-21:30",
        "wednesday": "08:30-21:30",
        "thursday": "08:30-21:30",
        "friday": "08:30-21:30",
        "saturday": "08:30-21:30",
      },
    },
    {
      "name": "صيدلية السلام",
      "address": "178 شارع 23 يوليو، بورسعيد",
      "latitude": 31.2653,
      "longitude": 32.3019,
      "phone": "0663200000",
      "email": "salam@portsaid-pharmacy.com",
      "licenseNumber": "EG-01234",
      "isActive": true,
      "rating": 4.4,
      "totalReviews": 980,
      "deliveryAvailable": true,
      "deliveryFee": 18,
      "minOrderAmount": 60,
      "workingHours": {
        "sunday": "09:00-22:00",
        "monday": "09:00-22:00",
        "tuesday": "09:00-22:00",
        "wednesday": "09:00-22:00",
        "thursday": "09:00-22:00",
        "friday": "09:00-22:00",
        "saturday": "09:00-22:00",
      },
    },
  ];
  Future<void> uploadCategories() async {
    try {
      print('🚀 بدء رفع التصنيفات...');

      final batch = _firestore.batch();
      final categoriesRef = _firestore.collection('pharmacies');

      for (final category in categories) {
        final docRef = categoriesRef.doc();
        batch.set(docRef, {
          ...category,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        print('✅ تمت إضافة: ${category['name']}');
      }

      await batch.commit();
      print('🎉 تم رفع جميع التصنيفات بنجاح!');
      print('📊 العدد الإجمالي: ${categories.length} تصنيف');
    } catch (e) {
      print('❌ خطأ في رفع البيانات: $e');
      rethrow;
    }
  }

  Future<void> clearCategories() async {
    try {
      print('🗑️ بدء مسح التصنيفات...');

      final categoriesRef = _firestore.collection('pharmacies');
      final snapshot = await categoriesRef.get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      print('🎉 تم مسح جميع التصنيفات بنجاح!');
    } catch (e) {
      print('❌ خطأ في مسح البيانات: $e');
      rethrow;
    }
  }
}
