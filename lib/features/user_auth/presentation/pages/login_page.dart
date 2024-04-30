import 'package:educast/features/user_auth/presentation/button_icon_teacher_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:educast/firebase_auth/auth.dart';
import 'package:educast/firebase_auth/show_snack_bar.dart';
import 'package:educast/features/user_auth/presentation/pages/button_icon_student_page.dart';
import 'package:educast/wigets/gradient_button.dart';
import 'package:educast/pallet.dart';
import 'package:educast/wigets/app_bar.dart';
import 'package:educast/wigets/text_button.dart';
import 'package:educast/wigets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
   

  void loginUser() async {

    FirebaseAuthMethods().loginWithEmail(
        email: emailcontroller.text,
        password: passwordcontroller.text,
        context: context);
        
        
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        

    final emailStudent = await emailAlreadyExistsStudent(emailcontroller.text);
    final emailTeacher = await emailAlreadyExistsTeacher(emailcontroller.text);
    if (emailStudent == true) {
      await prefs.setString('userType', 'student');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ButtonIconStudentPage();
          },
        ),
      );
    } else if (emailTeacher == true) {
      await prefs.setString('userType', 'teacher');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ButtonIconTeacherPage();
          },
        ),
      );
    } else {
      showSnackBar(context, 'Email not found!!');
    }
  }

   

  // Checking if email exists in student collection
  Future<bool> emailAlreadyExistsStudent(String email) async {
    final db = FirebaseFirestore.instance;
    final QuerySnapshot = await db
        .collection('students')
        .where('email', isEqualTo: emailcontroller.text)
        .limit(1)
        .get();

    return QuerySnapshot.docs.isNotEmpty;
  }

  Future<bool> emailAlreadyExistsTeacher(String email) async {
    final db = FirebaseFirestore.instance;
    final QuerySnapshot = await db
        .collection('teachers')
        .where('email', isEqualTo: emailcontroller.text)
        .limit(1)
        .get();

    return QuerySnapshot.docs.isNotEmpty;
  }

  // Forgot password 
  Future<void> resetPassword() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String email = emailcontroller.text;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      setState(() {
        showSnackBar(context, 'Email is sent to reset the password ');
      });
    } catch (e) {
      setState(() {
        showSnackBar(context, 'Failed to send password reset email. Please try again.');
      });
      print('Error sending password reset email: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LogIn',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 30,
            right: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textcolor),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldArea(
                textFieldController: emailcontroller,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Pallete.textcolor),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldArea(
                textFieldController: passwordcontroller,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextButton(
                  ontap: resetPassword,
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return const ForgotPassword();
                    // }));
                  
                  title: 'Forgot Password?'),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GradientButton(
                  title: 'Login',
                  ontap: loginUser,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
