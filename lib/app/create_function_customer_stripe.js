const functions = require("firebase-functions");
const admin = require("firebase-admin");
const Stripe = require("stripe");

admin.initializeApp();
const db = admin.firestore();

const stripe = new Stripe(stripeSecretKey);

// HTTP callable function you can call from Flutter
exports.createStripeCustomer = functions.https.onCall(async (data, context) => {
  try {
    const { email, name, uid } = data;

    // Create customer on Stripe
    const customer = await stripe.customers.create({
      email,
      name,
    });

    // Save Stripe customer ID in Firestore
    await db.collection(kUSerStripe).doc(uid).set(
      {
        stripeCustomerId: customer.id,
      },
      { merge: true }
    );

    return { customerId: customer.id };
  } catch (error) {
    throw new functions.https.HttpsError("unknown", error.message, error);
  }
});
