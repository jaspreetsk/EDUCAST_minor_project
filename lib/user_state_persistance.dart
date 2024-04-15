import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/login_page.dart';
import 'package:educast/features/user_auth/presentation/pages/student_home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPersistance extends StatelessWidget {
  UserPersistance({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    return Scaffold();
  }
}
