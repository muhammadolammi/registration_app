import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:registration_screen/pages/loading_page.dart';

import '../firebase_options.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8a2387),
        title: Text('Register'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            default:
              LoadingPage();
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xff8a2387),
                        Color(0xff8a94057),
                        Color(0xff8a27121)
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset('images/logo1.png'),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 400,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Register Here',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: 250,
                                child: TextField(
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _email,
                                  decoration: InputDecoration(
                                    labelText: 'EMAIL ',
                                    suffixIcon: Icon(FontAwesomeIcons.envelope),
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                child: TextField(
                                  enableSuggestions: false,
                                  obscureText: true,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _password,
                                  decoration: InputDecoration(
                                    labelText: 'Secure Password',
                                    suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: GestureDetector(
                                      child: Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                            color: Colors.orangeAccent[700]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                      child: Text(
                                        'Already a user? Sign In',
                                        style: TextStyle(
                                            color: Colors.orangeAccent[700]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () async {
                                    try {
                                      final email = _email.text;
                                      final password = _password.text;
                                      final UserCredential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/home', (route) => false);

                                      print(UserCredential);
                                    } catch (err) {
                                      print('An Error Occured');
                                      print(err);
                                    }
                                  },
                                  child: Container(
                                    width: 250,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                          Color(0xff8a2387),
                                          Color(0xff8a94057),
                                          Color(0xff8a27121)
                                        ])),
                                    child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )),
                            ]),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
