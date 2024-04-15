// Creating a User Model

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String emailID;
  final String phoneNo;
  final String password;
  final String role;

  UserModel(
    this.name,
    this.emailID,
    this.phoneNo,
    this.password,
    this.role,
  );

  // Saving user data to firestore

  Future<void> saveUserData(UserModel user) async{
    try {
      final CollectionReference usersCollection=FirebaseFirestore.instance.collection('users');
      await usersCollection.add({
        'name': user.name,
        'password':user.password,
        'emailID': user.emailID,
        'phoneNo':user.phoneNo,
        'role':user.role
      });
      print('User Data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  
  
}


