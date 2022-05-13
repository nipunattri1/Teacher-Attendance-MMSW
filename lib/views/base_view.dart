import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teacher_attendance/views/auth/auth.dart';
import 'package:teacher_attendance/views/auth/not_authourized.dart';
import 'package:teacher_attendance/views/home/home_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snap.connectionState == ConnectionState.active &&
            snap.hasData) {
          if (snap.data != null &&
              !snap.data!.email!.endsWith("manavmangalschool.com") &&
              !kDebugMode) {
            return NotAuth();
          }
          return const HomeView();
        } else {
          return const AuthView();
        }
      },
    );
  }
}
