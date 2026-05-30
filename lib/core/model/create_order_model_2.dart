import 'package:cloud_firestore/cloud_firestore.dart';

class CreateOrderModel {
  String? id;
  String? address;
  bool deliver;
  double? deliveryCost;
  String state;
  String payment;
  String phoneNumber;
  String totlePrice;
  String userId;
  String userNamed;
  String pharmacyId;
  String pharmacyName;
  String dataAdd;
  List<DetiliesOrderModel> items;
  CreateOrderModel({
    this.address,
    this.id,
    required this.deliver,
    this.deliveryCost,
    required this.payment,
    required this.state,
    required this.phoneNumber,
    required this.totlePrice,
    required this.userId,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.userNamed,
    required this.dataAdd,
    required this.items,
  });

 factory CreateOrderModel.fromFireStore(
    id,
    Map<String, dynamic> data,
    List<DetiliesOrderModel> items,

  ) {
    
 return CreateOrderModel(
        id: id,
        address: data['address'],
        deliver: data['deliver'],
        deliveryCost: data['deliveryCost'],
        payment: data['payment'],
        state: data['state'],
        phoneNumber: data['phoneNumber'],
        totlePrice: data['totlePrice'],
        userId: data['userId'],
        userNamed: data['userNamed'],
        pharmacyId: data['pharmacyId'],
        pharmacyName: data['pharmacyName'],
        dataAdd: data['dataAdd'],
        items: items,
      );
  }
  Map<String, dynamic> toFireStore() {
    return {
      'address': address,
      'deliver': deliver,
      'deliveryCost': deliveryCost,
      'payment': payment,
      'state': state,
      'phoneNumber': phoneNumber,
      'totlePrice': totlePrice,
      'userId': userId,
      'userNamed': userNamed,
      'pharmacyId': pharmacyId,
      'pharmacyName': pharmacyName,
      'dataAdd': dataAdd,
    };
  }
}

class DetiliesOrderModel {
  String productName;
  String idItem;
  String itemCount;
  String itemPrice;

  DetiliesOrderModel({
    required this.productName,
    required this.idItem,
    required this.itemCount,
    required this.itemPrice,
  });

  DetiliesOrderModel.fromFireStore(Map<String, dynamic> data)
    : this(
       // استخدام .toString() يضمن أن الحقل نصي دائماً ويمنع خطأ الـ Assertion
      idItem: data['idItem']?.toString() ?? '',
      productName: data['productName']?.toString() ?? '',
      itemCount: data['itemCount']?.toString() ?? '0',
      itemPrice: data['itemPrice']?.toString() ?? '0',
      );

  Map<String, dynamic> toFireStore() {
    return {
      'idItem': idItem,
      'productName': productName,
      'itemCount': itemCount,
      'itemPrice': itemPrice,
    };
  }
}
