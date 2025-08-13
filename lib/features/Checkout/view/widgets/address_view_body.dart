import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';


class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController numberHouseController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16,
        children: [
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            hintText: "الاسم كامل",
            obscureText: false,
            onSaved: (name) {
              nameController.text = name!;
            },
            controller: nameController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            hintText: "البريد الإلكتروني",
            obscureText: false,
            onSaved: (email) {
              emailController.text = email!;
            },
            controller: emailController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            hintText: "العنوان",
            obscureText: false,
            onSaved: (address) {
              addressController.text = address!;
            },
            controller: addressController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            hintText: "المدينه",
            obscureText: false,
            isvalidate: false,
            onSaved: (city) {
              cityController.text = city!;
            },
            controller: cityController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            hintText: "رقم الطابق , رقم الشقه .. ",
            obscureText: false,
            isvalidate: false,
            onSaved: (numberHouse) {
              numberHouseController.text = numberHouse!;
            },
            controller: numberHouseController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            hintText: "رقم الموبايل",
            obscureText: false,
            onSaved: (phone) {
              phoneController.text = phone!;
            },
            controller: phoneController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "حفظ العنوان",
                style: TextStyle(color: AppColor.grayscale950),
              ),
              SizedBox(width: 10),
              Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}