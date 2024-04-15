import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key,
  required this.title,
  });
  @override
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
       backgroundColor: Pallete.backgroundColor,
        title: Text(title,
        style:const  TextStyle(
          fontSize: 30,
          color: Pallete.textcolor,
          fontWeight: FontWeight.bold,
        
        ),),
        centerTitle: true,
    );
  }
}