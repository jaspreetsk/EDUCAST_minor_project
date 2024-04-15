

import 'package:educast/features/user_auth/presentation/pages/analysis_page.dart';
import 'package:educast/pallet.dart';

import 'package:flutter/material.dart';


class TeacherJoinPage extends StatelessWidget {
  const TeacherJoinPage({super.key});

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
              constraints: BoxConstraints(
                maxHeight: 450,
              ),
              color: Pallete.textcolor,
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
      width: 180,
      decoration: BoxDecoration(
       color: Pallete.buttoncolor, 
       borderRadius: BorderRadius.circular(10),
          ),
        
      
      child: ElevatedButton(
         onPressed: (){
          
         },
         child: Text(
          'Shared Screen', 
         style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Pallete.textcolor,
         ),),
         style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
         ),
      ),
      
    ),

              Container(
      width: 90,
      decoration: BoxDecoration(
       color: Pallete.buttoncolor, 
       borderRadius: BorderRadius.circular(10),
          ),
        
      
      child: ElevatedButton(
         onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return AnalysisPage();
          }));
         },
         child: Text(
          'End', 
         style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Pallete.textcolor,
         ),),
         style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
         ),
      ),
    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

