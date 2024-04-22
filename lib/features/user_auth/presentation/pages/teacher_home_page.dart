import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/login_page.dart';
import 'dart:math';
import 'package:educast/features/user_auth/presentation/pages/teacher_join_page.dart';
import 'package:educast/pallet.dart';
// import 'package:educast/resources/jitsi_meet_methods.dart';
import 'package:educast/wigets/app_bar.dart';
import 'package:educast/wigets/gradient_button.dart';
import 'package:educast/wigets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherHomePage extends StatelessWidget {
  final TextEditingController sessionIDcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  TeacherHomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create Session'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: 30,
            right: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Session Id',
                style: TextStyle(
                  fontSize: 18,
                  color: Pallete.textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldArea(
                textFieldController: sessionIDcontroller,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 18,
                  color: Pallete.textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldArea(
                textFieldController: passwordcontroller,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: GradientButton(
                      title: 'Create',
                      ontap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TeacherJoinPage();
                        }));
  })),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: GradientButton(
                    title: 'Logout',
                    ontap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
