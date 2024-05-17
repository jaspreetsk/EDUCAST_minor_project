import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/student_home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
// import 'package:educast/resources/jitsi_meet_methods.dart';
import 'package:educast/wigets/buttons_icons.dart';
import 'package:educast/wigets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MeetingScreen extends StatefulWidget {
  final String text;
  final IconData icon;
  MeetingScreen({super.key, required this.text, required this.icon});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  // Initialize when the user exits the meeting
  final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics_instance.setAnalyticsCollectionEnabled(true);
    // JitsiMeetEventListener();
    super.initState();
  }

  final jitsiMeet = JitsiMeet();
  void join() async {
   
    var options = JitsiMeetConferenceOptions(
      serverURL: "https://meet.jit.si",
      room: "123458769087",
      configOverrides: {
        "startWithAudioMuted": true,
        "startWithVideoMuted": true,
        "subject": "JitsiwithFlutter",
        "localSubject": "localJitsiwithFlutter",
      },
      featureFlags: {"unsaferoomwarning.enabled": false},
      userInfo: JitsiMeetUserInfo(
          displayName: "Flutter user", email: "user@example.com"),
    );
    jitsiMeet.join(
      options,
    
    );
   
   
  }

  // final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonIcon(
          onPressed: () {
           
            
            
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return StudentHomePage();
                },
              ),
            );
          },
          icon: widget.icon,
          text: widget.text,
        ),
        SizedBox(height: 20),
        Center(
          child: GradientButton(
              title: 'Logout',
              ontap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              }),
        )
      ],
    );
  }
}
