import 'dart:ui';

import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final dynamic Function() ontap;
  const GradientButton({super.key,
  required this.title,
  required this.ontap,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
       color: Pallete.buttoncolor, 
       borderRadius: BorderRadius.circular(10),
          ),
        
      
      child: ElevatedButton(
         onPressed: ontap,
         child: Text(
          title, 
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
    );
  }
}