import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/pallet.dart';
import 'package:educast/wigets/app_bar.dart';

import 'package:educast/wigets/gradient_button.dart';
import 'package:educast/wigets/text_field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class StudentHomePage extends StatelessWidget {
  final TextEditingController sessionIDcontroller = TextEditingController();
  String? roomName;
   final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;
   late DateTime? jitsiStartTime; 
  late DateTime? jitsiEndTime;
  
  StudentHomePage({super.key});

  final jitsiMeet = JitsiMeet();
  void join(String roomName) async {
   
    var options = JitsiMeetConferenceOptions(
      serverURL: "https://meet.jit.si",
      room: roomName,
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
      options,JitsiMeetEventListener(
        conferenceTerminated: (url, error) async {
          // Called when the active conference ends,
          // be it because of user choice or because of a failure.
          jitsiEndTime = DateTime.now();
          print('Conference terminated. URL: $url, Error: ${error.toString()}');
          print(
              '=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-oioo jitsi end time    $jitsiEndTime');
          final Duration EngagementDuration = jitsiEndTime!
              .difference(jitsiStartTime!); // Calculated the time spent.
          print(
              '=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-oioo  calculated time difference  $EngagementDuration');
          print('=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-oioo    ${error.toString()}');
          await analytics_instance.logEvent(
            name: 'Jaspreet_JITSIMEET_Time',
            parameters: {
              'Jaspreet_time_spent': EngagementDuration.inMinutes,
            },
          );
        },
      ),
    
    );
   
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Meeting page'),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(
            top: 50,
            left: 30,
            right: 30,
          ) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Session Id',
              style: TextStyle(
                fontSize: 18,
                color: Pallete.textcolor,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 10,),
              TextFieldArea(
                textFieldController: sessionIDcontroller,
              ),
              
              const SizedBox(height: 20,),
              

              Center(child: GradientButton(title: 'Join', ontap: (){
                roomName=sessionIDcontroller.text;
                join(roomName!);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                //   return ButtonIconStudentPage(); //studenthomepage() to ButtonIconStudentPage
                // }));
              })),
              const SizedBox(height: 15,),
              Center(
                child: GradientButton(title: 'Logout', ontap: ()async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const HomePage();
                  }));
                }),
              )
            ],
          ),
        
          ),
      ),
    );
  }
}