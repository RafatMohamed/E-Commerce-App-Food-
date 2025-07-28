import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../generated/assets.dart';

class CustomNotificationW extends StatelessWidget {
  const CustomNotificationW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 45,
      height: 45,
      decoration: const ShapeDecoration(
        color: Color(0xFFEEF8ED),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(Assets.imagesNotification, fit: BoxFit.scaleDown),
    );
  }
}
