class UserModel {
  String? uid;
  String? userName;
  String? email;
  String? phone;
  String? tokenDevice;
  List<AddressModel>? addresses; // تعديل ليصبح قائمة من العناوين

  UserModel({
    this.uid,
    this.userName,
    this.email,
    this.phone,
    this.tokenDevice,
    this.addresses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    
    return UserModel(
      uid: json['uid'],
      userName: json['user_name'],
      email: json['email'],
      phone: json['phone']?.toString(),
      tokenDevice: json['tokenDevice'],
      // معالجة القائمة (List) القادمة من Firebase بشكل آمن
      addresses: json['addresses'] != null
          ? (json['addresses'] as List)
              .map((item) => AddressModel.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'user_name': userName,
      'email': email,
      'phone': phone,
      'tokenDevice': tokenDevice,
      // تحويل القائمة بالكامل إلى JSON عند الرفع لـ Firebase
      'addresses': addresses?.map((item) => item.toJson()).toList(),
    };
  }
}

// الكلاس الجديد المسؤول عن أي عنوان يضيفه المستخدم
class AddressModel {
  String? title; // هنا يتم حفظ الاسم المخصص (منزل، عمل، منزل صديقي...)
  AddressDetailsModel? addressDetails;
  LocationModel? location;

  AddressModel({this.title, this.addressDetails, this.location});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      title: json['title'],
      addressDetails: AddressDetailsModel.fromJson(json['addressDetails']),
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'addressDetails': addressDetails?.toJson(),
      'location': location?.toJson(),
    };
  }
}

class AddressDetailsModel {
  String? city;
  String? street;
  String? governorates;

  AddressDetailsModel({this.city, this.street, this.governorates});

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddressDetailsModel(
      city: json['city'],
      street: json['street'],
      governorates: json['governorates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
      'governorates': governorates,
    };
  }
}

class LocationModel {
  String? long;
  String? lat;

  LocationModel({this.long, this.lat});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      long: json['long']?.toString(),
      lat: json['lat']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'long': long,
      'lat': lat,
    };
  }
}