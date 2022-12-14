import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:registration_screen/pages/loading_page.dart';
import 'package:registration_screen/pages/login.dart';
import 'package:registration_screen/pages/noteview.dart';
import 'package:registration_screen/pages/verifyemailview.dart';

import '../firebase_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;

            if (user != null) {
              if (user?.emailVerified ?? false) {
                return NoteView();
              } else {
                return VerifyEmailview();
              }
            } else {
              return Login();
            }

          default:
            return LoadingPage();
        }
      },
    );
  }
}
