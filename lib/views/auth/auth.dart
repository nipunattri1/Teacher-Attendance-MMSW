import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image.asset(
          //   'assets/logo/logo.png',
          //   height: MediaQuery.of(context).size.height * .4,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircleAvatar(
                radius: 64,
                child: Text(
                  'School Logo Here',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Text(
            "MMSW Zrk Teacher Attendance",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sign-in using your school account via Google to Continue.",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: SizedBox(
                height: 46,
                child: ElevatedButton(
                  onPressed: () async {
                    // sing in with google
                    log("Signing in with Google");
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    final GoogleSignIn _googleSignIn = GoogleSignIn();
                    try {
                      final GoogleSignInAccount? googleSignInAccount =
                          await _googleSignIn.signIn();
                      final GoogleSignInAuthentication
                          googleSignInAuthentication =
                          await googleSignInAccount!.authentication;
                      final AuthCredential credential =
                          GoogleAuthProvider.credential(
                        accessToken: googleSignInAuthentication.accessToken,
                        idToken: googleSignInAuthentication.idToken,
                      );
                      await _auth.signInWithCredential(credential);
                    } on FirebaseAuthException catch (e) {
                      print(e.message);
                      throw e;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svg/google.svg",
                          width: 25,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const Text("Continue with Google"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
