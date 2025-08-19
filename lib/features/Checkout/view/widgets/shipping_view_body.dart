import 'package:flutter/material.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import 'package:food_app/features/Checkout/view/widgets/shipping_items_selected.dart';
import '../../../../core/constant.dart';
import '../../../../core/service/StorageLocal/shared_prefs.dart';

class ShippingViewBody extends StatefulWidget {
  const ShippingViewBody({super.key, required this.order});
  final OrderModel order;
  @override
  State<ShippingViewBody> createState() => _ShippingViewBodyState();
}
class _ShippingViewBodyState extends State<ShippingViewBody> with AutomaticKeepAliveClientMixin{
  late ValueNotifier<bool?> isSelectedNotifier;
  @override
  void initState(){
    isSelectedNotifier = ValueNotifier(widget.order.isCash);
    super.initState();
  }
  @override
  void dispose() {
    isSelectedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ValueListenableBuilder<bool?>(
          valueListenable: isSelectedNotifier,
          builder: (context, isSelected, _) {
            return ShippingItemsSelected(
              text: "الدفع عند الاستلام",
              subText: "التسليم من المكان",
              price: widget.order.cartModel.claculateTotalprice().toInt()+30,
              isSelected: isSelected==true,
              onTap: (){
                isSelectedNotifier.value = true;
                setState(() {});
                widget.order.isCash=isSelectedNotifier.value;
                PrefsStorage().saveBool(pIsCash, widget.order.isCash!);
              },
            );
          },
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder<bool?>(
          valueListenable: isSelectedNotifier,
          builder: (context, isSelected, _) {
            return ShippingItemsSelected(
              text: "اشتري الان وادفع لاحقا",
              subText: "يرجي تحديد طريقه الدفع",
              price: widget.order.cartModel.claculateTotalprice().toInt()+0,
              isSelected: isSelected==false,
              onTap: () {
                isSelectedNotifier.value = false;
                setState(() {});
                widget.order.isCash=isSelectedNotifier.value;
                PrefsStorage().saveBool(pIsCash, widget.order.isCash!);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;
}
