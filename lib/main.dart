import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/landin_screen.dart';
import './utils/constants.dart';
import 'package:dr_fit/screens/login_screen.dart';

import 'helpers/custom_page_transition_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
        }),
        primaryColorLight: Constants.primaryLight,
        appBarTheme: AppBarTheme(
          color: Constants.primaryLight,
        ),
      ),
      home: FirebaseAuth.instance.currentUser != null
          ? LandingScreen(
              user: FirebaseAuth.instance.currentUser,
            )
          : const LoginScreen(),
    );
  }
}
