import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploadController extends GetxController {
  var isLoading = false.obs;
  var statusMessage = "جاهز للرفع".obs;

  Future<void> startUpload() async {
    try {
      isLoading.value = true;
      statusMessage.value = "جاري قراءة الملف...";

      // 1. قراءة ملف الـ JSON من الـ assets
      List<Map<String, dynamic>> data = [
        {
          "id": "1",
          "name_ar": "القاهرة",
          "name_en": "Cairo",
          "cities": [
            {"id": "101", "name_ar": "مدينة نصر", "name_en": "Nasr City"},
            {"id": "102", "name_ar": "مصر الجديدة", "name_en": "Heliopolis"},
            {"id": "103", "name_ar": "المعادي", "name_en": "Maadi"},
            {
              "id": "104",
              "name_ar": "التجمع الخامس",
              "name_en": "Fifth Settlement",
            },
            {"id": "105", "name_ar": "وسط البلد", "name_en": "Downtown"},
            {"id": "106", "name_ar": "شبرا", "name_en": "Shubra"},
            {"id": "107", "name_ar": "حلوان", "name_en": "Helwan"},
            {"id": "108", "name_ar": "الزمالك", "name_en": "Zamalek"},
          ],
        },
        {
          "id": "2",
          "name_ar": "الجيزة",
          "name_en": "Giza",
          "cities": [
            {"id": "201", "name_ar": "المهندسين", "name_en": "Mohandessin"},
            {"id": "202", "name_ar": "الدقي", "name_en": "Dokki"},
            {"id": "203", "name_ar": "الهرم", "name_en": "Haram"},
            {"id": "204", "name_ar": "فيصل", "name_en": "Faisal"},
            {"id": "205", "name_ar": "6 أكتوبر", "name_en": "6th of October"},
            {"id": "206", "name_ar": "الشيخ زايد", "name_en": "Sheikh Zayed"},
            {"id": "207", "name_ar": "العجوزة", "name_en": "Agouza"},
            {"id": "208", "name_ar": "إمبابة", "name_en": "Imbaba"},
          ],
        },
      ];

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      WriteBatch batch = firestore.batch();

      statusMessage.value = "جاري تحضير البيانات لـ Firestore...";

      for (var gov in data) {
        // إضافة المحافظة
        DocumentReference govRef = firestore
            .collection('governorates')
            .doc(gov['id'].toString());
        batch.set(govRef, {
          'name_ar': gov['name_ar'],
          'name_en': gov['name_en'],
        });

        // إضافة المدن التابعة لها
        List<dynamic> cities = gov['cities'];
        for (var city in cities) {
          DocumentReference cityRef = firestore
              .collection('cities')
              .doc(city['id'].toString());
          batch.set(cityRef, {
            'gov_id': gov['id'].toString(),
            'name_ar': city['name_ar'],
            'name_en': city['name_en'],
          });
        }
      }

      statusMessage.value = "جاري الرفع الفعلي للبيانات...";
      await batch.commit();

      statusMessage.value = "تم الرفع بنجاح!";
      Get.snackbar(
        "نجاح",
        "تم تحديث قواعد بيانات المحافظات والمدن",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      statusMessage.value = "حدث خطأ: $e";
      Get.snackbar("خطأ", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
