
import 'package:educast/pallet.dart';
import 'package:educast/features/user_auth/presentation/pages/button_icon_student_page.dart';
import 'package:educast/wigets/gradient_button.dart';
import 'package:flutter/material.dart';

class StudentJoinPage extends StatelessWidget {
  const StudentJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left:10,
          right: 10,
        ),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 450,
              ),
              color: Pallete.textcolor,
            ),
            const SizedBox(height: 10,),
            Center(
              child: GradientButton(title: 'End', ontap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const ButtonIconStudentPage();
                }));
              }),
            )
          ],
        ),
      ),
    );
  }
}