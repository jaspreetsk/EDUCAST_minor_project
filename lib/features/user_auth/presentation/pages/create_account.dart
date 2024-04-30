import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educast/features/user_auth/presentation/pages/login_page.dart';

import 'package:educast/firebase_auth/auth.dart';
import 'package:educast/firebase_auth/show_snack_bar.dart';
import 'package:educast/pallet.dart';
import 'package:educast/wigets/app_bar.dart';
import 'package:educast/wigets/check_box.dart';
import 'package:educast/wigets/gradient_button.dart';

import 'package:educast/wigets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController emailIDcontroller = TextEditingController();

  final TextEditingController phoneNumbercontroller = TextEditingController();

  final TextEditingController departmentcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmPasswordcontroller =
      TextEditingController();
  var role = "Student";

  var options = [
    'None',
    'Student',
    'Teacher',
  ];

  var _currentItemSelected = "None";
  void userFirestoreDB() async {
    try {
      signUpUser();
      if (role == 'Student') {
        await students
            .add({
              'name': namecontroller.text,
              'email': emailIDcontroller.text,
              'phoneno': phoneNumbercontroller.text,
              'role': 'student',
            })
            .then((value) => showSnackBar(context, 'Student Account created'))
            .catchError((error) => 'Failed to create account: $error');
      } else if (role == 'Teacher') {
        await teachers
            .add({
              'name': namecontroller.text,
              'email': emailIDcontroller.text,
              
              'phoneno': phoneNumbercontroller.text,
              'role': 'teacher',
            })
            .then((value) => showSnackBar(context, 'Teacher Account created'))
            .catchError((error) => 'Failed to create account: $error');
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  void signUpUser() async {
    await FirebaseAuthMethods().signupWithEmail(
        email: emailIDcontroller.text,
        password: passwordcontroller.text,
        context: context);
  }

  // For Firestore collection
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  CollectionReference teachers =
      FirebaseFirestore.instance.collection('teachers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create an Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 30,
            right: 30,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallete.textcolor),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldArea(
                  textFieldController: namecontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Email id',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallete.textcolor),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldArea(
                  textFieldController: emailIDcontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallete.textcolor),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldArea(
                  textFieldController: phoneNumbercontroller,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Role',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Pallete.textcolor),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Pallete.buttoncolor,
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Colors.white,
                      focusColor: Colors.white,
                      items: options.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Pallete.textcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          _currentItemSelected = newValueSelected!;
                          role = newValueSelected;
                        });
                      },
                      value: _currentItemSelected,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter Password',
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
                  height: 10,
                ),
                const Text(
                  'Confirm Password',
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
                  height: 10,
                ),
                const CheckBox(),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: GradientButton(
                    title: 'Create',
                    ontap: userFirestoreDB,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
