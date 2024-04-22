import 'package:educast/features/user_auth/presentation/pages/history_meeting_screen.dart';
import 'package:educast/features/user_auth/presentation/pages/create_new_meeting_screen_teacher.dart';
import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
import 'package:educast/pallet.dart';
import 'package:educast/wigets/buttons_icons.dart';
import 'package:educast/wigets/text_field.dart';
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

List<Widget> pages = [
  MeetingScreen(icon: Icons.videocam, text: 'Create new meeting',),
  const HistoryMeetingScreen(),
  const Text('Contacts'),
  const Text('Settings'),
  ];

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
        child: pages[_page],
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

