import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../core/functions/app_usage_service.dart';
import '../../core/model/data_pharmacy_model.dart';
import '../../core/model/model_categories.dart';
import '../../core/model/model_product.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  HomeControllerImp();
  List<CategoryModel> listCategories = [];
  List<ProductModel> listBestProducts = [];
  List<ProductModel> listProducts = [];
  List<ProductModel> listProductsSearch = [];
  List<DataPharmacyModel> listPharmaciesSearch = [];
  Rx<bool> isLoadingSearch = false.obs;
  final itemListSearch = <ProductModel>[].obs;
  final pharmacyListSearch = <DataPharmacyModel>[].obs;
  Rx<bool> isPharmacy = false.obs;
  String name = '';

  @override
  void onInit() {
    getdate();
    getCategoriesData();
    getBestProducts();
    super.onInit();
  }

  getdate() async {
    name = (await AppUsageService.getUserName()) ?? '';
    print(name);
    update();
  }

  Future<void> getCategoriesData() async {
    final response = await FirebaseFirestore.instance
        .collection('categories')
        .get();

    listCategories = response.docs.map((document) {
      return CategoryModel.fromMap(document.data());
    }).toList();

    if (listCategories.isNotEmpty) {
      print('اسم القسم الأول: ${listCategories[0].name}');
      print('تاريخ الإنشاء: ${listCategories[0].createdAt}');
    }

    update();
  }

  Future<void> getBestProducts() async {
    listBestProducts.clear();
    final response = await FirebaseFirestore.instance
        .collection('products_pharmacy')
        .get();

    listBestProducts = response.docs
        .where((doc) => doc.data()['isBestSell'] == true)
        .map((doc) => ProductModel.fromMap(doc.data()))
        .toList();

    if (listBestProducts.isNotEmpty) {
      print('اسم القسم الأول: ${listBestProducts[0].productName}');
      print('تاريخ الإنشاء: ${listBestProducts[0].createdAt}');
    }

    update();
  }

  searchProductsByPartialName(String searchTerm) async {
    if (searchTerm.isEmpty) {
      listProductsSearch.clear();
      listPharmaciesSearch.clear();
      update();
      return;
    }

    listProductsSearch.clear();
    listPharmaciesSearch.clear();
    isLoadingSearch.value = true;
    update();

    try {
      var result = await FirebaseFirestore.instance
          .collection('products_pharmacy')
          .limit(100)
          .get();
      var result2 = await FirebaseFirestore.instance
          .collection('pharmacies')
          .limit(50)
          .get();

      String searchLower = searchTerm.trim().toLowerCase();

      if (result.docs.isNotEmpty) {
        for (var doc in result.docs) {
          Map<String, dynamic> data = doc.data();
          String productName = (data['productName'] ?? '')
              .toString()
              .toLowerCase();

          if (productName.contains(searchLower)) {
            listProductsSearch.add(ProductModel.fromMap(data));
          }
        }
      }

      if (result2.docs.isNotEmpty) {
        for (var doc in result2.docs) {
          Map<String, dynamic> data = doc.data();
          String pharmacyName = (data['name'] ?? '').toString().toLowerCase();

          if (pharmacyName.contains(searchLower)) {
            listPharmaciesSearch.add(
              DataPharmacyModel.fromFirestore(data, doc.id),
            );
          }
        }
      }
      print(
        "نتائج البحث - منتجات: ${listProductsSearch.length} | صيدليات: ${listPharmaciesSearch.length}",
      );
    } catch (e) {
      print("خطأ في البحث: $e");
    } finally {
      isLoadingSearch.value = false;
      update();
    }
  }

  //=========================================================================
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadDummyPharmacies() async {
    // 🔥 تم تحويل مواعيد العمل الافتراضية إلى قائمة من كائنات WorkDay لتطابق الموديل الجديد تماماً
    List<WorkDay> standardWorkingHours = [
      WorkDay(
        day: 'Saturday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Sunday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Monday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Tuesday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Wednesday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Thursday',
        open: '09:00 AM',
        close: '11:00 PM',
        isClosed: false,
      ),
      WorkDay(
        day: 'Friday',
        open: '04:00 PM',
        close: '11:00 PM',
        isClosed: false,
      ),
    ];

    List<DataPharmacyModel> pharmaciesList = [
      DataPharmacyModel(
        id: 'ph_01',
        name: 'El-Shifa Modern Pharmacy',
        province: 'Cairo',
        city: 'Downtown',
        street: 'Tahrir Street, In front of Metro Station',
        latitude: 30.0444,
        longitude: 31.2357,
        phone: '+201012345678',
        email: 'shifa.modern@eilajaa.com',
        licenseNumber: 'LIC-2026-001',
        isActive: true,
        imageUrl:
            'https://images.unsplash.com/photo-1586015555751-63bb77f4322a?q=80&w=400',
        workingHours: standardWorkingHours,
        createdAt: DateTime.now(),
      ),
      DataPharmacyModel(
        id: 'ph_02',
        name: 'El-Ezaby Medical Pharmacy',
        province: 'Giza',
        city: 'Al-Haram',
        street: 'Main Haram Street, Next to National Bank of Egypt',
        latitude: 30.0131,
        longitude: 31.2089,
        phone: '+201198765432',
        email: 'elezaby.med@eilajaa.com',
        licenseNumber: 'LIC-2026-002',
        isActive: true,
        imageUrl:
            'https://images.unsplash.com/photo-1631549916768-4119b295f846?q=80&w=400',
        workingHours: standardWorkingHours,
        createdAt: DateTime.now(),
      ),
      DataPharmacyModel(
        id: 'ph_03',
        name: 'Egypt Digital Pharmacy',
        province: 'Cairo',
        city: 'Heliopolis',
        street: 'Roxy Square, Behind Cinema Roxy',
        latitude: 30.0914,
        longitude: 31.3142,
        phone: '+201255554443',
        email: 'egypt.digital@eilajaa.com',
        licenseNumber: 'LIC-2026-003',
        isActive: true,
        imageUrl:
            'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=400',
        workingHours: standardWorkingHours,
        createdAt: DateTime.now(),
      ),
      DataPharmacyModel(
        id: 'ph_04',
        name: 'Al-Salam & Eilajaa Pharmacy',
        province: 'Alexandria',
        city: 'Sidi Gaber',
        street: 'Stanley Corniche Road, Beside Costa Coffee',
        latitude: 31.2350,
        longitude: 29.9575,
        phone: '+201533322211',
        email: 'salam.eilajaa@eilajaa.com',
        licenseNumber: 'LIC-2026-004',
        isActive: true,
        imageUrl:
            'https://images.unsplash.com/photo-1607619056574-7b8d304f3c6f?q=80&w=400',
        // تخصيص يوم الجمعة ليكون مغلقاً تماماً في هذه الصيدلية كمثال
        workingHours: [
          WorkDay(
            day: 'Saturday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Sunday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Monday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Tuesday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Wednesday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Thursday',
            open: '09:00 AM',
            close: '11:00 PM',
            isClosed: false,
          ),
          WorkDay(
            day: 'Friday',
            open: '00:00 AM',
            close: '00:00 AM',
            isClosed: true,
          ),
        ],
        createdAt: DateTime.now(),
      ),
    ];

    try {
      WriteBatch batch = _firestore.batch();

      for (var pharmacy in pharmaciesList) {
        DocumentReference docRef = _firestore
            .collection('pharmacies')
            .doc(pharmacy.id);
        batch.set(docRef, pharmacy.toFirestore());
      }

      await batch.commit();

      Get.snackbar(
        "Success",
        "4 Pharmacies uploaded successfully with full English data!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to upload data: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  //===================================================================

  Future<void> uploadLocationsToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final Map<String, List<String>> locationsData = {
      'Cairo': ['Downtown', 'Heliopolis', 'Maadi', 'Nasr City'],
      'Giza': ['Al-Haram', 'Dokki', 'Mohandessin', 'October City'],
      'Alexandria': ['Sidi Gaber', 'Smouha', 'Stanly'],
      'Sharqia': ['Zagazig', '10th of Ramadan', 'Belbeis', 'Minya al-Qamh'],
    };

    try {
      for (var entry in locationsData.entries) {
        await firestore.collection('locations').doc(entry.key).set({
          'governorateName': entry.key,
          'cities': entry.value,
        });
      }
      print("✨ تم رفع المحافظات والمدن بنجاح إلى الفايرستور!");
    } catch (e) {
      print("❌ خطأ أثناء رفع البيانات: $e");
    }
  }

  //======================================================================
  Future<void> uploadDummyProducts() async {
    // 1. قائمة بمعرفات وأسماء الصيدليات الأربعة
    List<Map<String, String>> pharmacies = [
      {'id': 'ph_01', 'name': 'El-Shifa Modern Pharmacy'},
      {'id': 'ph_02', 'name': 'El-Ezaby Medical Pharmacy'},
      {'id': 'ph_03', 'name': 'Egypt Digital Pharmacy'},
      {'id': 'ph_04', 'name': 'Al-Salam & Eilajaa Pharmacy'},
    ];

    // 2. هيكلة المنتجات العلاجية البشرية مقسمة حسب التصنيفات الأربعة لديك
    Map<String, List<Map<String, dynamic>>> productsDataByCategory = {
      // ==================== أدوية (Medicines) ====================
      'Medicines': [
        {
          'productId': 'prod_med_01',
          'productName': 'Panadol Advance 500mg',
          'productDes':
              'Human analgesic and antipyretic. Used for fast and effective relief of mild to moderate human body pain and fever.',
          'dosageForm': 'Tablets',
          'price': 45.0,
          'productImage':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMiCYC4lBVQ7H2_5AM8PYSikbyoOut0xHvfQ&s',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_med_02',
          'productName': 'Augmentin 1g Antibiotic',
          'productDes':
              'Broad-spectrum antibiotic for human therapeutic use. Treats severe bacterial infections of the respiratory and urinary tracts.',
          'dosageForm': 'Tablets',
          'price': 99.5,
          'productImage':
              'https://cdn.salla.sa/paPzl/jeqnr4MS0E7sz1R9F0gDc4DL3G28hFSpAhxTDUtO.jpg',
          'isBestSell': true,
          'requiresPrescription': true,
        },
        {
          'productId': 'prod_med_03',
          'productName': 'Catafast 50mg',
          'productDes':
              'Fast-acting human non-steroidal anti-inflammatory drug (NSAID). Relieves acute muscular pain, toothaches, and painful human conditions.',
          'dosageForm': 'Sachets Powder',
          'price': 65.0,
          'productImage':
              'https://cdn.altibbi.com/cdn/cache/large/image/2021/09/15/ebe9f6a35133f3ac3b305359607ee60f.webp',
          'isBestSell': false,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_med_04',
          'productName': 'Brufen 400mg',
          'productDes':
              'Anti-inflammatory and analgesic therapy for humans. Indicated for management of joint pain, chronic arthritis, and headaches.',
          'dosageForm': 'Tablets',
          'price': 38.0,
          'productImage':
              'https://cdn.salla.sa/qaXdd/SrCRuN5ln024HNY76HKpSrlOgNqTzwgpEeTf31Is.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
      ],

      // ==================== أطفال (children) ====================
      'children': [
        {
          'productId': 'prod_baby_01',
          'productName': 'Pampers Premium Care Size 3',
          'productDes':
              'Hygienic human infant care product. Dermatologically tested for sensitive baby skin with superior medical-grade absorption layers.',
          'dosageForm': 'Diapers Pack',
          'price': 280.0,
          'productImage':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5nVXYNmml8b2TQcBvuEbKfS3R4kh1tkt0aQ&s',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_baby_02',
          'productName': 'Johnson\'s Baby Shampoo 500ml',
          'productDes':
              'Pediatric-approved human baby care solution. Hypoallergenic, clinical formula designed gently for cleansing neonatal skin and hair.',
          'dosageForm': 'Shampoo Bottle',
          'price': 85.0,
          'productImage':
              'https://images-eu.ssl-images-amazon.com/images/I/61C5jhCo2VL._AC_UL495_SR435,495_.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_baby_03',
          'productName': 'Sanosan Baby Rash Cream 150ml',
          'productDes':
              'Therapeutic topical zinc oxide cream for pediatric human use. Prevents and heals severe skin diaper rash and skin inflammation.',
          'dosageForm': 'Cream Tube',
          'price': 160.0,
          'productImage':
              'https://russkaya-apteka.com/wp-content/uploads/2022/02/img_2267-768x768.jpg',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_baby_04',
          'productName': 'Cerelac Wheat & Milk 400g',
          'productDes':
              'Nutritional supplementary diet for human infants from 6 months onwards. Fortified with daily essential vitamins and iron for growth support.',
          'dosageForm': 'Cereal Cerelac',
          'price': 95.0,
          'productImage':
              'https://cd3c14-whites.akinoncloudcdn.com/products/2025/09/10/45999/c29182d0-c790-4f35-ac22-eb7d9eca73cc.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
      ],

      // ==================== فيتامين (Vitamins) ====================
      'Vitamins': [
        {
          'productId': 'prod_vit_01',
          'productName': 'Centrum Lutein Multivitamin',
          'productDes':
              'Complete daily micronutrient formula for human adults. Supports biological immune functions, physical endurance, and cardiovascular health.',
          'dosageForm': 'Tablets Bottle',
          'price': 450.0,
          'productImage':
              'https://media.zid.store/4c4bc3af-e1aa-43ea-aab7-eeeb6bc4f5dc/a1102b61-4f68-4bf5-aa19-2df0e6a5cc77.webp',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_vit_02',
          'productName': 'Limitless Omega 3 Fish Oil',
          'productDes':
              'High-purity lipid supplement for human dietary health. Rich in EPA/DHA essential for adult brain function and reducing systemic cholesterol.',
          'dosageForm': 'Softgels Capsule',
          'price': 190.0,
          'productImage':
              'https://ifit-eg.com/wp-content/uploads/2024/05/Omega.png',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_vit_03',
          'productName': 'Vitamin C 1000mg Effervescent',
          'productDes':
              'Therapeutic dose of ascorbic acid for human body immunity. Boosts cellular antioxidant defense, energy levels, and collagen synthesis.',
          'dosageForm': 'Effervescent Tablets',
          'price': 70.0,
          'productImage':
              'https://www.healthspan.co.uk/Images/Product/Default/xlarge/HS-Orange-Effervescent-Vitamin-C-1000mg-tube-FF8-_2048px_VCEF1040-Sep25.png',
          'isBestSell': false,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_vit_04',
          'productName': 'Neurobion Vitamin B Complex',
          'productDes':
              'Clinical human neurotropic vitamins therapy. Prescribed for treatment of acute neuritis, painful nerve damage, and metabolic peripheral neuropathies.',
          'dosageForm': 'Ampoules Injection',
          'price': 60.0,
          'productImage':
              'https://images-na.ssl-images-amazon.com/images/I/710xJL2oFrL._SS400_.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
      ],

      // ==================== عناية (care) ====================
      'care': [
        {
          'productId': 'prod_care_01',
          'productName': 'Vichy Mineral 89 Serum',
          'productDes':
              'Dermatological therapeutic hydration serum for human skin care. Formulated with mineralizing thermal water to repair damaged skin barrier.',
          'dosageForm': 'Serum Gel',
          'price': 650.0,
          'productImage':
              'https://www.vichy.eg/ar/site/pages/showImageResized.aspx?EncMediaId=bGpKQy9ZYjIvNllETXdCbEJHL2E2Zz09&ImageFormatAppCode=IMAGEFORMAT_ORIGINAL&v=20263161052347',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_care_02',
          'productName': 'La Roche-Posay Anthelios SPF50+',
          'productDes':
              'Medical sun protection fluid for human epidermal safety. Provides clinical defense against ultra-violet rays preventing skin malignancies.',
          'dosageForm': 'Fluid Cream',
          'price': 520.0,
          'productImage': 'https://m.media-amazon.com/images/I/51WC+UB8NFL.jpg',
          'isBestSell': true,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_care_03',
          'productName': 'Bioderma Sensibio H2O 250ml',
          'productDes':
              'Hypoallergenic micellar solution for human dermatological cleansing. Designed clinically for ultra-sensitive skin types to prevent irritation.',
          'dosageForm': 'Micellar Water',
          'price': 290.0,
          'productImage':
              'https://www.basharacare.com/media/catalog/product/b/i/bioderma_bundles-6_2.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
        {
          'productId': 'prod_care_04',
          'productName': 'CeraVe Hydrating Cleanser 236ml',
          'productDes':
              'Therapeutic body and face wash for human dry skin conditions. Enriched with essential human-identical ceramides to maintain skin moisture.',
          'dosageForm': 'Lotion Cleanser',
          'price': 340.0,
          'productImage':
              'https://static.beautytocare.com/cdn-cgi/image/f=auto/media/catalog/product//c/e/cerave-hydrating-cleanser-normal-to-dry-skin-236ml_1_1.jpg',
          'isBestSell': false,
          'requiresPrescription': false,
        },
      ],
    };

    try {
      WriteBatch batch = FirebaseFirestore.instance.batch();
      int totalProductsCreated = 0;

      for (var pharmacy in pharmacies) {
        String phId = pharmacy['id']!;
        String phName = pharmacy['name']!;

        productsDataByCategory.forEach((categoryKey, productsList) {
          String actualCategoryId = '';
          if (categoryKey == 'Medicines')
            actualCategoryId = 'KSKY5mJ5OZlHnr7rf4yM';
          if (categoryKey == 'Vitamins')
            actualCategoryId = 'SEtBk1ToJ5A5Q8yoEA40';
          if (categoryKey == 'care') actualCategoryId = 'cEstydqVuQ5ozWvlSMQ9';
          if (categoryKey == 'children')
            actualCategoryId = 'psQMAOJOt0zemQAc5BV3';

          for (var item in productsList) {
            String uniqueDocId = "${phId}_${item['productId']}";

            DocumentReference docRef = FirebaseFirestore.instance
                .collection('products_pharmacy')
                .doc(uniqueDocId);

            ProductModel productModel = ProductModel(
              id: uniqueDocId,
              idProduct: item['productId'],
              idPharmacy: phId,
              pharmacyId: phId,
              pharmacyName: phName,
              productName: item['productName'],
              searchName: item['productName'].toString().toLowerCase().trim(),
              categoryName: categoryKey,
              categoryId: actualCategoryId,
              productImage: item['productImage'],
              productDes: item['productDes'],
              dosageForm: item['dosageForm'],
              stock: 50,
              count: 1,
              price: item['price'],
              isBestSell: item['isBestSell'],
              requiresPrescription: item['requiresPrescription'],
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );

            batch.set(docRef, productModel.toMap());
            totalProductsCreated++;
          }
        });
      }

      await batch.commit();

      Get.snackbar(
        "نجاح العملية ✨",
        "تم رفع $totalProductsCreated منتج طبي علاجي للبشر وتوزيعهم بنجاح على الصيدليات!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "خطأ في الرفع ❌",
        "فشل رفع بيانات المنتجات: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
      print("Firestore upload error: $e");
    }
  }

  //======================================================================
}
