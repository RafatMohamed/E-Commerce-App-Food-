import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app/core/constant.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/features/Checkout/data/Model/order_model.dart';
import '../../../../core/service/StorageLocal/shared_prefs.dart';
import '../../../../core/widgets/custom_text_form_field.dart';


class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key, required this.orderModel,});
  final OrderModel orderModel;
  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  @override
  void initState() {
    super.initState();

    widget.orderModel.addressOrderModel ??= AddressOrderModel(
      name: '',
      email: '',
      address: '',
      city: '',
      numberFloor: '',
      phoneNumber: '',
    );

    Future.microtask(() async {
      final savedName = PrefsStorage().getString(pAddressName);
      final savedEmail = PrefsStorage().getString(pAddressEmail);
      final savedAddress = PrefsStorage().getString(pAddress);
      final savedCity = PrefsStorage().getString(pCity);
      final savedFloor = PrefsStorage().getString(pNumberFloor);
      final savedPhone = PrefsStorage().getString(pPhoneNumber);

      if (savedName.isNotEmpty ||
          savedEmail.isNotEmpty ||
          savedAddress.isNotEmpty ||
          savedCity.isNotEmpty ||
          savedPhone.isNotEmpty) {
        setState(() {
          isSwitch = true;
          nameController.text = savedName;
          emailController.text = savedEmail;
          addressController.text = savedAddress;
          cityController.text = savedCity;
          numberHouseController.text = savedFloor;
          phoneController.text = savedPhone;

          widget.orderModel.addressOrderModel!
            ..name = savedName
            ..email = savedEmail
            ..address = savedAddress
            ..city = savedCity
            ..numberFloor = savedFloor
            ..phoneNumber = savedPhone;
        });
      }
    });
  }
  bool isSwitch = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController() ;
  final TextEditingController cityController = TextEditingController();
  final TextEditingController numberHouseController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    numberHouseController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16,
        children: [
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            hintText: "الاسم كامل",
            obscureText: false,
            onSaved: (namee) {
              nameController.text = namee!;
              widget.orderModel.addressOrderModel!.name = namee;
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
              widget.orderModel.addressOrderModel!.email =email;
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
              widget.orderModel.addressOrderModel!.address = address;
            },
            controller: addressController,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            hintText: "المدينه",
            obscureText: false,
            onSaved: (city) {
              cityController.text = city!;
              widget.orderModel.addressOrderModel!.city = city;
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
              widget.orderModel.addressOrderModel!.numberFloor = numberHouse ;
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
              widget.orderModel.addressOrderModel!.phoneNumber = phone;
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
              const SizedBox(width: 10),
              Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                  Form.of(context).save();
                  widget.orderModel.addressOrderModel = AddressOrderModel(
                    name: nameController.text,
                    email: emailController.text,
                    address: addressController.text,
                    city: cityController.text,
                    numberFloor: numberHouseController.text,
                    phoneNumber: phoneController.text,
                  );
                  if(value){
                    PrefsStorage().saveString(pAddressName,widget.orderModel.addressOrderModel!.name);
                    PrefsStorage().saveString(pAddressEmail,widget.orderModel.addressOrderModel!.email);
                    PrefsStorage().saveString(pAddress,widget.orderModel.addressOrderModel!.address);
                    PrefsStorage().saveString(pCity,widget.orderModel.addressOrderModel!.city);
                    PrefsStorage().saveString(pNumberFloor,widget.orderModel.addressOrderModel!.numberFloor??"");
                    PrefsStorage().saveString(pPhoneNumber,widget.orderModel.addressOrderModel!.phoneNumber);
                    debugPrint("✅ Address saved in model & locally");
                  }else{
                    PrefsStorage().saveString(pAddressName,"");
                    PrefsStorage().saveString(pAddressEmail,"");
                    PrefsStorage().saveString(pAddress,"");
                    PrefsStorage().saveString(pCity,"");
                    PrefsStorage().saveString(pNumberFloor,"");
                    PrefsStorage().saveString(pPhoneNumber,"");
                    debugPrint("❌ Switch OFF, address not saved");
                  }
                },
              ),
              const SizedBox(width: 10),
              IconButton(onPressed: (){
                log(widget.orderModel.isCash?.toString() ?? "isCash not set");
                if (widget.orderModel.addressOrderModel != null) {
                  log(widget.orderModel.addressOrderModel!.name);
                  log(widget.orderModel.addressOrderModel!.numberFloor ?? "floor");
                } else {
                  log("AddressOrderModel is not set yet");
                }

                log(widget.orderModel.cartModel.cartItem.first.productModel.code);
              }, icon: const Icon(Icons.ac_unit))
            ],
          ),
        ],
      ),
    );
  }
}