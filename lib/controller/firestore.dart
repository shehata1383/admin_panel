import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 1. إنشاء وثيقة مستخدم (Root Collection)
  Future<void> createUser(String uid, String name, String phone) async {
    await _db.collection('users').doc(uid).set({
      'name': name,
      'phone': phone,
      'created_at': FieldValue.serverTimestamp(), // توقيت السيرفر
      'address': {'city': 'Cairo', 'street': 'Main St'}, // استخدام Map
    });
  }

  // 2. إضافة منتج إلى Sub-collection داخل صيدلية معينة
  Future<void> addPharmacyProduct(
    String pharmacyId,
    String productId,
    double price,
    int stock,
  ) async {
    // الهيكل: pharmacies (Collection) -> pharmacyId (Doc) -> inventory (Sub-collection)
    await _db
        .collection('pharmacies')
        .doc(pharmacyId)
        .collection('inventory')
        .doc(productId)
        .set({
          'price': price,
          'stock': stock,
          'is_available': stock > 0,
          'last_update': FieldValue.serverTimestamp(),
        });
  }

  // 3. إنشاء طلب (Root Collection) مع مصفوفة منتجات
  Future<void> createOrder({
    required String userId,
    required String pharmacyId,
    required List<Map<String, dynamic>> items,
    required double total,
  }) async {
    await _db.collection('orders').add({
      'user_id': userId,
      'pharmacy_id': pharmacyId,
      'items': items, // مصفوفة تحتوي على تفاصيل المنتجات (Denormalization)
      'total_price': total,
      'status': 'pending',
      'created_at': FieldValue.serverTimestamp(),
    });
  }

  // 4. إنشاء محادثة مع Sub-collection للرسائل
  Future<void> startChat(
    String userId,
    String pharmacyId,
    String firstMessage,
  ) async {
    // إنشاء الوثيقة الأساسية للمحادثة
    DocumentReference chatRef = await _db.collection('chats').add({
      'participants': [userId, pharmacyId],
      'last_message': firstMessage,
      'last_update': FieldValue.serverTimestamp(),
    });

    // إضافة أول رسالة في الـ Sub-collection
    await chatRef.collection('messages').add({
      'sender_id': userId,
      'text': firstMessage,
      'sent_at': FieldValue.serverTimestamp(),
    });
  }
}
