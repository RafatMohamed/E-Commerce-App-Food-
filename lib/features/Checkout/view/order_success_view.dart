import 'package:flutter/material.dart';

import '../data/Model/order_model.dart';

class OrderConfirmationView extends StatelessWidget {
  static const String routeName = "OrderConfirmationView";
  final OrderModel order;

  const OrderConfirmationView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Confirmation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text("Your order has been placed successfully!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Order ID: ${order.userId}"), // example
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); // go home
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
