import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import '../../../cart/data/cart_item_model.dart';

class PaymentPayPalModel {
  final Amount amount;
  final String description;
  final ItemList itemList;

  PaymentPayPalModel({
    required this.amount,
    required this.description,
    required this.itemList,
  });

  factory PaymentPayPalModel.fromEntity(OrderModel order) {
    return PaymentPayPalModel(
      amount: Amount.fromEntity(order),
      description:
      order.cartModel.cartItem.first.productModel.description ?? '',
      itemList: ItemList.fromEntity(order),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.toJson(),
      'description': description,
      'item_list': itemList.toJson(),
    };
  }
}

class Amount {
  final String total;
  final String currency;
  final AmountDetails details;

  Amount({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory Amount.fromEntity(OrderModel order) {
    return Amount(
      total: calculateTotalAll(order),
      currency: getCurrency() ?? 'USD',
      details: AmountDetails.fromEntity(order),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}

class AmountDetails {
  final String subtotal;
  final String shipping;
  final String shippingDiscount;

  AmountDetails({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory AmountDetails.fromEntity(OrderModel order) {
    return AmountDetails(
      subtotal: getSubtotal(order),
      shipping: getShipping(order),
      shippingDiscount: getShippingDiscount(order).toStringAsFixed(2),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}

class ItemList {
  final List<Item> items;

  ItemList({required this.items});

  factory ItemList.fromEntity(OrderModel order) {
    var itemsList = order.cartModel.cartItem
        .map((cartItem) => Item.fromEntity(cartItem))
        .toList() ??
        [];
    return ItemList(items: itemsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class Item {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory Item.fromEntity(CartItemModel order) {
    return Item(
      name: order.productModel.name ?? '',
      quantity: order.count ?? 0,
      price: order.productModel.price.toStringAsFixed(2),
      currency: getCurrency() ?? 'USD',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}

/// Helpers

String? getCurrency() {
  return 'USD';
}

String getSubtotal(OrderModel order) {
  final subtotal = order.cartModel.claculateTotalprice();
  return subtotal.toStringAsFixed(2);
}

String getShipping(OrderModel order) {
  if (order.isCash == true) {
    return '30.00';
  } else {
    return '0.00';
  }
}

double getShippingDiscount(OrderModel order) {
  return 0.0;
}

String calculateTotalAll(OrderModel order,{ bool isStripe = false}) {
  final subtotal = double.tryParse(getSubtotal(order)) ?? 0.0;
  final shipping = double.tryParse(getShipping(order)) ?? 0.0;
  final discount = getShippingDiscount(order);

  final total = subtotal + shipping - discount;
  return isStripe ? (total * 100).round().toString() : total.toStringAsFixed(2);
}
