import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final googleSignIn = GoogleSignIn();
  bool isSignedIn = false;
  bool isNewUser = false;

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
    final result = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .catchError((error) {
      PlatformException authException = error;
      print(authException.message);
    });
    if (result.user != null) {
      DatabaseReference userDatabaseRef = FirebaseDatabase.instance
          .reference()
          .child("users/${result.user.uid}/");
      Map userDataMap = {
        'User Name': result.user.displayName,
        'Email': result.user.email,
        'User ID': result.user.uid,
      };
      userDatabaseRef.set(userDataMap);
      isNewUser = true;
    }
    return result;
  }

  void signOutWithGoogle() async {
    FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    isSignedIn = false;
  }
}
