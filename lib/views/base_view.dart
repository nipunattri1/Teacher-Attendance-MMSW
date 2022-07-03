import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teacher_attendance/views/auth/auth.dart';
import 'package:teacher_attendance/views/auth/not_authourized.dart';
import 'package:teacher_attendance/views/home/home_view.dart';

class BaseView extends StatefulWidget {
  /// Base View is a stateless widget which returns the appropriate view based on the user's authentication status.
  /// If the user is authenticated, it returns the [HomeView] widget.
  /// If the user is not authenticated, it returns the [NotAuth] widget.
  /// If the user is not authenticated and the [Auth] widget is not provided, it returns the [Auth] widget.

  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool network = true;
  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result != ConnectivityResult.none) {
        setState(() {
          network = true;
        });
      } else {
        setState(() {
          network = false;
        });
      }
    });
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return network
        ? StreamBuilder<User?>(
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
                  return const NotAuth();
                }
                return const HomeView();
              } else {
                return const AuthView();
              }
            },
          )
        : Scaffold(
            body: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .5,
                  child: Image.asset("assets/Saly-44.png"),
                ),
                const Text(
                  "You are not connected to internet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Internet is requried to run this application",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          );
  }
}
