import 'package:firebase_auth/firebase_auth.dart';

String _handleError(FirebaseAuthException e) {
  switch (e.code) {
  // Registration-related errors
    case 'weak-password':
      return 'The password provided is too weak.';
    case 'email-already-in-use':
      return 'The account already exists for that email.';
    case 'invalid-email':
      return 'The email address is badly formatted.';
    case 'user-disabled':
      return 'The user account has been disabled.';
    case 'operation-not-allowed':
      return 'This operation is not allowed.';

  // Reset password errors
    case 'user-not-found':
      return 'No user found for that email.';
    case 'wrong-password':
      return 'Incorrect password provided for that user.';
    case 'invalid-credential':
      return 'Invalid email or password. Please check and try again.';
    case 'too-many-requests':
      return 'Too many login attempts. Try again later.';

  // Email verification errors
    case 'missing-android-pkg-name':
      return 'Android package name is required for this operation.';
    case 'missing-ios-bundle-id':
      return 'iOS bundle ID is required for this operation.';

  // Phone authentication errors
    case 'invalid-phone-number':
      return 'The phone number format is invalid.';
    case 'quota-exceeded':
      return 'SMS quota exceeded for the project. Try again later.';

  // Password reset errors

  // Firebase Auth errors related to API
    case 'account-exists-with-different-credential':
      return 'An account already exists with a different credential.';
    case 'credential-already-in-use':
      return 'This credential is already in use.';


  // Catch all errors not handled above
    default:
      return 'An error occurred: ${e.message ?? 'Please try again later.'}';
  }
}


String getErrorMessage(FirebaseAuthException e) => _handleError(e);