import 'package:cloud_firestore/cloud_firestore.dart';

class DataPharmacyModel {
  final String id;
  final String name;
  final String province;
  final String city;
  final String street;
  final double latitude;
  final double longitude;
  final String phone;
  final String email;
  final String licenseNumber;
  final bool isActive;
  final String imageUrl;
  final List<WorkDay> workingHours;
  final DateTime createdAt;

  const DataPharmacyModel({
    required this.id,
    required this.name,
    required this.province,
    required this.city,
    required this.street,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.email,
    required this.licenseNumber,
    required this.isActive,
    required this.imageUrl,
    required this.workingHours,
    required this.createdAt,
  });

  factory DataPharmacyModel.fromFirestore(
    Map<String, dynamic> data,
    String docId,
  ) {
    return DataPharmacyModel(
      id: docId,
      // 🔥 تم تعديل جلب الاسم ليتوافق مع الحقل المرفوع بقاعدة البيانات لتجنب الـ Null
      name: data['name'] ?? data['Name'] ?? '',
      province: data['province'] ?? '',
      city: data['city'] ?? '',
      street: data['street'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      licenseNumber: data['licenseNumber'] ?? '',
      isActive: data['isActive'] ?? false,
      imageUrl: data['imageUrl'] ?? '',
      workingHours:
          (data['workingHours'] as List?)
              ?.map((e) => WorkDay.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      // 🛠️ إصلاح: يُفضل توحيد حالة الحرف الأول لتكون 'name' بدلاً من 'Name'
      'name': name.trim(),
      // 💡 إضافة ذكية: حقل مخصص للبحث بحروف صغيرة لتجنب مشاكل استعلامات الفايرستور الحساسة لحالة الأحرف
      'searchnameName': name.toLowerCase().trim(),
      'province': province,
      'city': city,
      'street': street,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'email': email,
      'licenseNumber': licenseNumber,
      'isActive': isActive,
      'imageUrl': imageUrl,
      // 🔥 إصلاح: إضافة .toList() لأن Firestore لا يقبل المابرات الخام (MappedIterable) بل يطلب قائمة صريحة
      'workingHours': workingHours.map((workDay) => workDay.toJson()).toList(),
      'createdAt':
          FieldValue.serverTimestamp(), // يضمن تسجيل التوقيت من خادم فايربيز مباشرة
    };
  }
}

// كلاس فرعي يمثل تفاصيل اليوم الواحد
class WorkDay {
  final String day;
  final String open;
  final String close;
  final bool isClosed;

  WorkDay({
    required this.day,
    required this.open,
    required this.close,
    required this.isClosed,
  });

  factory WorkDay.fromJson(Map<String, dynamic> json) {
    return WorkDay(
      day: json['day'] ?? '',
      open: json['open'] ?? '09:00 AM', // قيم افتراضية منطقية للصيدليات
      close: json['close'] ?? '11:00 PM',
      isClosed: json['isClosed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'day': day, 'open': open, 'close': close, 'isClosed': isClosed};
  }
}
