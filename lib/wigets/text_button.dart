import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final dynamic Function() ontap;
  const CustomTextButton({super.key,
  required this.ontap,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      autofocus: true,
      onPressed: ontap, 
      child: Text(title,
                style: const TextStyle(
                  color: Pallete.textcolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                ) 
      );
  }
}