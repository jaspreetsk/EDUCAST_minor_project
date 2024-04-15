import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class TextFieldArea extends StatelessWidget {
  
  final TextEditingController textFieldController;
 
   TextFieldArea( {super.key,required this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return  TextField(
              controller: textFieldController,
              style: TextStyle(
                color: Pallete.textcolor,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Pallete.buttoncolor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10),
                  ),
                ),
              ),
            ); 
  }
}

class textAreaFieldController{
  
}