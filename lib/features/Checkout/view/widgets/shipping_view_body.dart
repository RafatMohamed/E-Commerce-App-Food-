import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_text_styles.dart';
import 'package:food_app/core/widgets/custom_button.dart';
import 'package:food_app/features/Checkout/view/widgets/shipping_items_selected.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'check_out_view_body.dart';
import 'list_step_checkout.dart';


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
        SizedBox(height: 10),
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