
import 'package:educast/firebase_auth/show_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  
  //FirebaseAuthMethods(this._auth);

  // for user statre paersistance
  //Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  //Email sign up
  Future<void> signupWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
  //Email Login

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Email Verification

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification Sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // SignOut User

  Future<void> signOut(BuildContext context) async
  {
    try {
      
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  //
  
}
