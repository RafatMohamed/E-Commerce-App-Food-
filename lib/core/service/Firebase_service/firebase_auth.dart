import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future deletUser()async{
    return await _auth.currentUser!.delete();
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<bool> isExistUser(bool isCheckExist) async {
    if (isCheckExist) {
      return _auth.currentUser != null;

    } else {
      return _auth.currentUser == null;
    }
  }
  Future<User> signUp({
    required String emailAddress,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential.user!;
  }
  Future<User> signIn({
    required String emailAddress,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential.user!;
  }

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signOutFromGoogle() async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Create GoogleSignIn instance
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Sign out from Google
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
      try {
        await googleSignIn.disconnect(); // May fail if not connected
      } catch (e) {
        if (kDebugMode) {
          log('Disconnect failed: $e');
        } // Safe fallback
      }
    }
  }
}
