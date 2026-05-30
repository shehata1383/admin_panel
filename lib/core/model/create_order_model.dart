class OrderModel {
  String? orderId;
  String? pharmacyId;
  String? address;
  double? totalPrice; // تم تعديل الاسم ليكون دقيقاً إملائياً totalPrice بدلاً من totlePrice
  bool? deliver;
  String? userNamed;
  String? userId;
  String dataAdd; // تحويل النص الزمني إلى أوبجكت DateTime
  String? phoneNumber;
  String? pharmacyName;
  String? payment;
  String? state;
  String? timeDelivery;
  double? deliveryCost;
  List<OrderItemModel> items; // مصفوفة الأدوية المشتراة

  OrderModel({
    required this.dataAdd,
    this.pharmacyId,
    this.orderId,
    this.address,
    this.totalPrice,
    this.deliver,
    this.userNamed,
    this.userId,
    this.phoneNumber,
    this.pharmacyName,
    this.payment,
    this.state,
    this.deliveryCost,
    this.timeDelivery,
    required this.items,
  });

  factory OrderModel.fromJson({required Map<String, dynamic> json,String? orderId}) {
    return OrderModel(
      orderId: orderId ?? "",
      pharmacyId: json['pharmacyId'],
      address: json['address'],
      timeDelivery: json['time_delivery'],
      totalPrice: (json['totlePrice'] as num?)?.toDouble(), // يقرأ المفتاح القديم كما هو بالفايربيز
      deliver: json['deliver'] as bool?,
      userNamed: json['userNamed'],
      userId: json['userId'],
      // تحويل نص الـ ISO string القادم من الفايربيز إلى DateTime
      dataAdd: json['dataAdd'] ,
      phoneNumber: json['phoneNumber']?.toString(),
      pharmacyName: json['pharmacyName'],
      payment: json['payment'],
      state: json['state'],
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble(),
      // تحويل الـ List المتداخلة بأمان
      items: json['items'] != null
          ? (json['items'] as List)
              .map((item) => OrderItemModel.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pharmacyId': pharmacyId,
      'address': address,
      'totlePrice': totalPrice, // يحفظ بنفس الإسم المعتمد بفايربيز لديك
      'deliver': deliver,
      'userNamed': userNamed,
      'userId': userId,
      'timeDelivery': timeDelivery,
      // تحويل الـ DateTime إلى نص قبل الحفظ في الفايربيز
      'dataAdd': dataAdd,
      'phoneNumber': phoneNumber,
      'pharmacyName': pharmacyName,
      'payment': payment,
      'state': state,
      'deliveryCost': deliveryCost,
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}class OrderItemModel {
  String idProduct;
  double price;
  int count;
  String categoryName;
  String productName;
  String categoryId;

  OrderItemModel({
 required   this.idProduct,
  required  this.price,
  required  this.count,
 required   this.categoryName,
 required   this.productName,
 required   this.categoryId,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      idProduct: json['id_product'],
      // التعامل المرن مع الأرقام العشرية والصحيحة القادمة من الفايربيز
      price: json['price'],
      count: json['count'] ,
      categoryName: json['categoryName'],
      productName: json['productName'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': idProduct,
      'price': price,
      'count': count,
      'categoryName': categoryName,
      'productName': productName,
      'categoryId': categoryId,
    };
  }
}