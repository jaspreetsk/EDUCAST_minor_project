import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
   bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          side: BorderSide(
            color: Pallete.textcolor,
          ),
          activeColor: Pallete.buttoncolor,
          value: _isChecked,
          onChanged: (newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
        ),
        Text(
          'User Agreement',
          style: TextStyle(
            fontSize: 15,
            color: Pallete.textcolor,
            ),
        ),
      ],
    );
  }
}