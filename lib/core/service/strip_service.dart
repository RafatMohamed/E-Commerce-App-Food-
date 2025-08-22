import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../const_key_secret.dart';
import 'network/api_helper.dart';
import 'network/end_points.dart';
import '../../features/Checkout/data/Model/strip_model/model/init_ephemeral_model.dart';
import '../../features/Checkout/data/Model/strip_model/model/models/ephemeral_key_model/ephemeral_key_model.dart';
import '../../features/Checkout/data/Model/strip_model/model/models/payment_intent_model/payment_intent_model.dart';
import '../../features/Checkout/data/Model/strip_model/model/payment_inpur_model.dart';

class StripeService{
  ApiHelper apiHelper = ApiHelper();
  Future<PaymentIntentModel> createTestPaymentSheet({required PaymentInputModel paymentInputModel}) async {
    final response = await apiHelper.postDioRequest(
      endpoint: EndPoints.paymentIntents,
      body: paymentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      expectStatusKey: false,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  Future<EphemeralKeyModel> createEphemeralKey({required String customerId}) async {
    final response = await apiHelper.postDioRequest(
      headers: {
        'Authorization': 'Bearer $cardToken',
        'Stripe-Version': '2025-04-30.basil',
      },
      endpoint: EndPoints.createEphemeralKey,
      body: {
        'customer': customerId
      },
      contentType: Headers.formUrlEncodedContentType,
      expectStatusKey: false,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future<void> initPaymentSheet({required InitEphemeralModel initEphemeralModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Raafat ',
        paymentIntentClientSecret: initEphemeralModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:initEphemeralModel.ephemeralKey ,
        customerId: initEphemeralModel.customerId,

      ),
    );
  }
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> confirmPaymentSheet({required PaymentInputModel paymentInputModel}) async {
    var paymentIntentModel = await createTestPaymentSheet(paymentInputModel: paymentInputModel);
    var paymentIntentEphemeralModel = await createEphemeralKey(customerId: paymentInputModel.customerId);
    InitEphemeralModel initEphemeralModel = InitEphemeralModel(paymentIntentClientSecret: paymentIntentModel.clientSecret!, customerId: paymentInputModel.customerId, ephemeralKey:paymentIntentEphemeralModel.secret! );
    await initPaymentSheet(initEphemeralModel: initEphemeralModel);
    await displayPaymentSheet();

  }

}