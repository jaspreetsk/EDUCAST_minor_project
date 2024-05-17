import 'package:educast/features/user_auth/presentation/pages/student_home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
import 'package:educast/firebase_options.dart';
import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/pallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
 const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;
  int _pausedCount = 0;
  int _resumedCount = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      _resumedCount++;
      analytics_instance.logEvent(
        name: 'App_resumed',
        parameters: {
          'count': _resumedCount,
        }
      );
    } else if(state == AppLifecycleState.paused) {
      _pausedCount++;
      analytics_instance.logEvent(
        name: 'App_Paused',
        parameters: {
          'count': _pausedCount,
        },
      );
    }
    print("**PAUSED_COUNT******$_pausedCount");
    print("<<<<<<RESUMED_COUNT>>>>>>>$_resumedCount");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduCast',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
        //color.fromRGBO(249, 108, 0, 1)
      ),
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasError && snapshot.hasData) {
                SharedPreferences? prefs = snapshot.data!;
                bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
                String userType = prefs.getString('userType') ?? '';
                if (isLoggedIn) {
                  if (userType == 'student') {
                    // Originally it was StudentHomePage()
                    return StudentHomePage();
                  } else if (userType == 'teacher') {
                    return TeacherHomePage();
                  }
                }
                return HomePage();
              } else {
                return HomePage();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
