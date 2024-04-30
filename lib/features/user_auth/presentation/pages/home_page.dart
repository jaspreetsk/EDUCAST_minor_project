import 'package:educast/features/user_auth/presentation/pages/create_account.dart';

import 'package:educast/wigets/gradient_button.dart';
import 'package:educast/features/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

//import 'package:educast/pallet.dart';
import 'package:educast/wigets/app_bar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAnalytics analytics_instance = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics_instance.setAnalyticsCollectionEnabled(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'EDUCAST',
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            GradientButton(
                title: 'Login',
                ontap: () async {
                  await analytics_instance
                      .logEvent(name: 'Login');
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                }),
            const SizedBox(
              height: 30,
            ),
            GradientButton(
              title: 'Create Account',
              ontap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CreateAccount();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
