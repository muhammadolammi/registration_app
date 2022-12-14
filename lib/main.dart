import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registration_screen/constants/routes.dart';
import 'package:registration_screen/pages/home.dart';
import 'package:registration_screen/pages/loading_page.dart';
import 'package:registration_screen/pages/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:registration_screen/pages/register.dart';
import 'package:registration_screen/pages/verifyemailview.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.purple),
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      loginRoute: (context) => Login(),
      homeRoute: (context) => Home(),
      verify_emailRoute: (context) => VerifyEmailview(),
      registerRoute: (context) => Register(),
    },
  ));
}
