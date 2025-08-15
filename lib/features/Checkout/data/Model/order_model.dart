import '../../../cart/data/cart_model.dart';

class OrderModel {
  final CartModel cartModel;
   AddressOrderModel? addressOrderModel;
   bool? isCash;

  OrderModel({
     this.addressOrderModel,
    required this.cartModel,
     this.isCash,
  });
}

class OrderModelInitial {
  final bool isCash;
  final CartModel cartModel;
  final AddressOrderModelInit addressOrderModelInit;

  OrderModelInitial({
    required this.addressOrderModelInit,
    required this.cartModel,
    required this.isCash,
  });

  factory OrderModelInitial.fromJson(Map<String, dynamic> json) {
    return OrderModelInitial(
      addressOrderModelInit: AddressOrderModelInit.fromJson(json['addressOrderModelInit']),
      cartModel: CartModel.fromJson(json['cartModel']),
      isCash: json['isCash'] ?? true,
    );
  }

  OrderModelInitial toEntity() {
    return OrderModelInitial(
      addressOrderModelInit: addressOrderModelInit.toEntity(),
      cartModel: cartModel,
      isCash: isCash,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCash': isCash,
      'cartModel': cartModel.toJson(),
      'addressOrderModelInit': addressOrderModelInit.toJson(),
    };
  }
}
class AddressOrderModel {
   String name;
   String email;
   String address;
   String city;
   String? numberFloor;
   String phoneNumber;

  AddressOrderModel(
      {required this.name, required this.email, required this.address, required this.city, this.numberFloor, required this.phoneNumber});
}
  class AddressOrderModelInit{
  final String name;
  final String email;
  final String address;
  final String city;
  final String? numberFloor;
  final String phoneNumber;

 AddressOrderModelInit({required this.name,required this.email,required this.address,required this.city,this.numberFloor,required this.phoneNumber});

 factory AddressOrderModelInit.fromJson(Map<String, dynamic> json) {
   return AddressOrderModelInit(
     name: json['name'],
     email: json['email'],
     address: json['address'],
     city: json['city'],
     numberFloor: json['numberFloor'],
     phoneNumber: json['phoneNumber'],
   );
  }

  toEntity() {
    return AddressOrderModelInit(
      name: name,
      email: email,
      address: address,
      city: city,
      numberFloor: numberFloor,
      phoneNumber: phoneNumber,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'numberFloor': numberFloor,
      'phoneNumber': phoneNumber,
    };
  }
}
