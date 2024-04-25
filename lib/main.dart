import 'package:educast/features/user_auth/presentation/pages/student_home_page.dart';
import 'package:educast/features/user_auth/presentation/pages/teacher_home_page.dart';
import 'package:educast/firebase_options.dart';
import 'package:educast/features/user_auth/presentation/pages/home_page.dart';
import 'package:educast/pallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  // This widget is the root of your application.
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
