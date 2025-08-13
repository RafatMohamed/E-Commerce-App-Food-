import 'package:flutter/material.dart';
import 'package:food_app/features/Checkout/view/widgets/shipping_items_selected.dart';


class ShippingViewBody extends StatefulWidget {
  const ShippingViewBody({super.key});

  @override
  State<ShippingViewBody> createState() => _ShippingViewBodyState();
}

class _ShippingViewBodyState extends State<ShippingViewBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItemsSelected(
          text: "الدفع عند الاستلام",
          subText: "التسليم من المكان",
          price: 40,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
        const SizedBox(height: 10),
        ShippingItemsSelected(
          text: "اشتري الان وادفع لاحقا",
          subText: "يرجي تحديد طريقه الدفع",
          price: 0,
          isSelected: !isSelected,
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
      ],
    );
  }
}