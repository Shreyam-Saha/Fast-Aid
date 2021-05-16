import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final googleSignIn = GoogleSignIn();
  bool isSignedIn = false;

  Stream<User> get currentUser => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    isSignedIn = true;
    // Once signed in, return the UserCredential
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  void signOutWithGoogle() async {
    FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    isSignedIn = false;
  }
}
