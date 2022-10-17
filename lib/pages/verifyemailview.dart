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
    return Column(children: [
      Text('VERIFY EMAIL'),
      TextButton(
          onPressed: () async {
            await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            );
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
            print(user);
          },
          child: Text('Send Email Verification')),
    ]);
  }
}
