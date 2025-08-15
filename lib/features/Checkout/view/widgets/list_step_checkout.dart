import '../../../../core/utils/images.dart';

final List<String> listStepCheckout = ["الشحن", "العنوان", "الدفع","المراجعه",];

final List<String> cards = [Assets.masterCard, Assets.paypal];

int get currentStepLength => listStepCheckout.length;
