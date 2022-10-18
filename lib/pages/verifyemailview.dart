import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

class VerifyEmailview extends StatefulWidget {
  const VerifyEmailview({super.key});

  @override
  State<VerifyEmailview> createState() => _VerifyEmailviewState();
}

class _VerifyEmailviewState extends State<VerifyEmailview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              child: Text(
                'Verify your email',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
                  );
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();

                  print(user);
                },
                child: Text(
                  'Send Email Verification',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: Text(
                  'Back To Login',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
          ]),
        ),
      ),
    );
  }
}
