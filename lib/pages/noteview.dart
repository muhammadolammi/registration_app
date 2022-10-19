import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:registration_screen/constants/routes.dart';
import 'package:registration_screen/alertdiaogs.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                devtools.log(shouldLogout.toString());
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginRoute, (route) => false);
                }

                break;
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log Out'))
            ];
          })
        ],
      ),
    );
  }
}

enum MenuAction { logout }
