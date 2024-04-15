import 'package:educast/pallet.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const ButtonIcon(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Pallete.buttoncolor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            height: 60,
            width: 60,
            child: Icon(
              icon,
              color: Pallete.textcolor,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Pallete.textcolor,
            ),
          ),
        ],
      ),
    );
  }
}
