import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
import 'package:educast/pallet.dart';
import 'package:educast/wigets/buttons_icons.dart';
import 'package:flutter/material.dart';

class ButtonIconTeacherPage extends StatefulWidget {
  const ButtonIconTeacherPage({super.key});

  @override
  State<ButtonIconTeacherPage> createState() => _ButtonIconTeacherPageState();
}

class _ButtonIconTeacherPageState extends State<ButtonIconTeacherPage> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Meet and Chat',
          style: TextStyle(color: Pallete.textcolor),
        ),
        centerTitle: true,
        backgroundColor: Pallete.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonIcon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TeacherHomePage();
                    },
                  ),
                );
              },
              icon: Icons.videocam,
              text: 'Create New Meeting',
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Pallete.textcolor,
        selectedItemColor: Pallete.buttoncolor,
        unselectedItemColor: Pallete.backgroundColor,
        onTap: onPageChanged,
        currentIndex: _page,
        //type: BottomNavigationBarType.fixed,
        // unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
