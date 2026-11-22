# Fruit Shop | Flutter E-Commerce App

A Flutter shopping project with a fruit catalog, cart, multi-step checkout, Firebase authentication and Firestore-backed data.

## Features

- Splash and onboarding flow, with onboarding state saved locally.
- Email/password registration and login, plus a Facebook sign-in button connected to Firebase Authentication.
- Product browsing, categories, product details and a best-sellers query.
- Cart operations: add and remove products, change quantities, calculate totals and clear the cart.
- Checkout forms for shipping and address details, order submission to Firestore and an order-confirmation screen.
- Stripe Payment Sheet integration code and PayPal sandbox checkout, alongside a cash-payment option.

## Structure and state management

Feature-based folders under `lib/features/`, with UI, Cubits, models and repositories. Shared services and repository interfaces live in `lib/core/`. `get_it` supplies dependencies, and repository methods use `dartz` Either values for success/failure handling.

## Main packages

`flutter_bloc`, `get_it`, `dartz`, `firebase_auth`, `cloud_firestore`, `cloud_functions`, `dio`, `flutter_stripe`, `flutter_paypal_payment`, `flutter_facebook_auth`, `shared_preferences`, `flutter_svg` and `carousel_slider`.

## Getting started

Use a Flutter installation whose bundled Dart SDK satisfies `^3.7.2`, as declared in `pubspec.yaml`.

```bash
git clone https://github.com/RafatMohamed/E-Commerce-App-Food-.git
cd E-Commerce-App-Food-
flutter pub get
```

1. Configure a Firebase project for your own app identifiers. Enable Email/Password authentication and Cloud Firestore; configure Facebook authentication if you want to use that button. Regenerate the Firebase options and platform configuration for your project.
2. Populate the product/category collections expected by `lib/core/constant.dart` and the model serializers. Apply appropriate Firestore security rules.
3. The ignored `lib/app/const_keys.dart` is required by the source. References include `stripePublishableKey`, `cardToken`, `kClientId` and `kSecretKey`. Do not commit real credentials. The current client-side payment design must be changed so privileged Stripe and PayPal credentials stay on a server.
4. The app calls a `createStripeCustomer` Firebase callable function. A JavaScript sketch is present at `lib/app/create_function_customer_stripe.js`, but it is not a complete deployable backend: configuration/constants and a Functions project are still needed.
5. Complete the backend/payment configuration in test or sandbox mode before trying checkout.

After completing the configuration above:

```bash
flutter run
```

## Current scope and limitations

- Google sign-in has service, repository and Cubit code, but its login-button callback is commented out. The Apple sign-in button has an empty callback.
- An order-confirmation screen is present; live order-status or delivery tracking is not implemented in the reviewed code.
- The screen named Favourites is present, but it should not be treated as evidence of a complete saved-favourites workflow.
- Payments are integration/demo code, not a verified production checkout. PayPal is explicitly configured in sandbox mode.
- This README describes source-code implementation. Builds, external services and user flows have not been run as part of this documentation review.

## Code guide

- [`lib/features/Auth/Login/View/widgets/login_body_social.dart`](lib/features/Auth/Login/View/widgets/login_body_social.dart)
- [`lib/core/service/Firebase_service/firebase_auth.dart`](lib/core/service/Firebase_service/firebase_auth.dart)
- [`lib/core/repo/Product_repo/product_repo_imp.dart`](lib/core/repo/Product_repo/product_repo_imp.dart)
- [`lib/features/cart/logic/cart_cubit.dart`](lib/features/cart/logic/cart_cubit.dart)
- [`lib/features/Checkout/view/widgets/check_out_view_body.dart`](lib/features/Checkout/view/widgets/check_out_view_body.dart)
- [`lib/core/service/strip_service.dart`](lib/core/service/strip_service.dart)
- [`lib/core/service/get_it.dart`](lib/core/service/get_it.dart)
