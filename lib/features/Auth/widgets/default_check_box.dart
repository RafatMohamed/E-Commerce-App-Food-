import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class DefaultCheckBox extends StatelessWidget {
  const DefaultCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColor.green1500 : Colors.white,
          shape: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: isChecked ? AppColor.green1500 : const Color(0xffDDDFDF),
              width: 1.5,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
          ),
        ),
        child: Center(
          child:
          isChecked
              ? const Icon(Icons.check, size: 18, color: Colors.white)
              : const Text(""),
        ),
      ),
    );
  }
}
