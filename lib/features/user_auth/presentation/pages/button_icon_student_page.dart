import 'package:educast/features/user_auth/presentation/pages/history_meeting_screen.dart';
import 'package:educast/features/user_auth/presentation/pages/create_new_meeting_screen_teacher.dart';

import 'package:educast/pallet.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class ButtonIconStudentPage extends StatefulWidget {
  const ButtonIconStudentPage({super.key});

  @override
  State<ButtonIconStudentPage> createState() => _ButtonIconStudentPageState();
}

class _ButtonIconStudentPageState extends State<ButtonIconStudentPage> {
  final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;
  static List pageName =['Meet & Chat','Meetings','Contacts','Settings'];
  int _page = 0;
  onPageChanged(int page) async {
   await analytics_instance.logEvent(
      name: 'Bottom_navigator',
      parameters: {
        "page_name": pageName[page],
        "page_index": page, }
      );
    setState(() {
      _page = page;
    });
  }
  @override
  void initState(){
    analytics_instance.setAnalyticsCollectionEnabled(true);
    super.initState();
  }

  List<Widget> pages = [
    MeetingScreen(text: 'Join the meeting', icon: Icons.meeting_room,),
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
