import '../../../cart/data/cart_model.dart';

class OrderModel {
   CartModel cartModel;
   AddressOrderModel? addressOrderModel;
   bool? isCash;
   String userId;
   String? paymentMethode;
   num? totalPrice;

  OrderModel({
    this.totalPrice,
    required this.userId,
    this.paymentMethode,
    this.addressOrderModel,
    required this.cartModel,
    this.isCash,
  });
}

class OrderModelInitial {
  final bool isCash;
  final CartModel cartModel;
  final AddressOrderModelInit addressOrderModelInit;
  final String userId;
  final String? paymentMethode;
  final double totalPrice;

  OrderModelInitial({
    required this.totalPrice,
    required this.addressOrderModelInit,
    required this.cartModel,
    required this.isCash,
    required this.paymentMethode,
    required this.userId,
  });

  factory OrderModelInitial.fromJson(Map<String, dynamic> json) {
    return OrderModelInitial(
      totalPrice: json["totalPrice"],
      userId: json['userId'],
      paymentMethode: json['paymentMethode'],
      addressOrderModelInit: AddressOrderModelInit.fromJson(json['addressOrderModelInit']),
      cartModel: CartModel.fromJson(json['cartModel']),
      isCash: json['isCash'] ?? true,
    );
  }

  factory OrderModelInitial.fromEntity(OrderModel order) {
    return OrderModelInitial(
      totalPrice: order.cartModel.claculateTotalprice().toDouble(),
      addressOrderModelInit: AddressOrderModelInit.fromEntity(order.addressOrderModel!),
      cartModel: order.cartModel,
      isCash: order.isCash ?? true, // 👈 avoid null error
      paymentMethode: order.paymentMethode,
      userId: order.userId,
    );
  }

  /// Convert back to Domain Entity (OrderModel)
  OrderModel toEntity() {
    return OrderModel(
      totalPrice: cartModel.claculateTotalprice().toDouble(),
      userId: userId,
      paymentMethode: paymentMethode,
      addressOrderModel: addressOrderModelInit.toEntity(),
      cartModel: cartModel,
      isCash: isCash,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalPrice": totalPrice,
      "paymentMethode": paymentMethode,
      "userId": userId,
      "isCash": isCash,
      "cartModel": cartModel.toJson(),
      "addressOrderModelInit": addressOrderModelInit.toJson(),
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

  AddressOrderModel({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    this.numberFloor,
    required this.phoneNumber,
  });
}

class AddressOrderModelInit {
  final String name;
  final String email;
  final String address;
  final String city;
  final String? numberFloor;
  final String phoneNumber;

  AddressOrderModelInit({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    this.numberFloor,
    required this.phoneNumber,
  });

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

  factory AddressOrderModelInit.fromEntity(AddressOrderModel addressOrder) {
    return AddressOrderModelInit(
      name: addressOrder.name,
      email: addressOrder.email,
      address: addressOrder.address,
      city: addressOrder.city,
      numberFloor: addressOrder.numberFloor,
      phoneNumber: addressOrder.phoneNumber,
    );
  }

  /// Convert back to Entity
  AddressOrderModel toEntity() {
    return AddressOrderModel(
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
