import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '';

class AuthRepository{
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore
  }): _auth=auth,
      _firestore=firestore;
   // CollectionReference get _user => _firestore.collection(FirebaseConstants.)
  
  Future<void> signUpWithEmailAndPassword(String email, String password, String phone_no , int batch_year, String con_password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        
      );
      // Handle successful account creation
      print('User created: ${userCredential.user?.email}');
    } catch (e) {
      // Handle errors (e.g., invalid email, weak password, etc.)
      print('Error creating user: $e');
    }
  }
}