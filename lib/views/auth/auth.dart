import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:teacher_attendance/views/auth/initializing.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage("assets/logo/logo.png"),
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
              constraints: const BoxConstraints(maxWidth: 600),
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
                      await _auth.signInWithCredential(credential).then(
                            (value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Initializing(),
                              ),
                            ),
                          );
                    } on FirebaseAuthException catch (e) {
                      log(e.message.toString());
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Error"),
                          content: Text(e.message.toString()),
                          actions: [
                            ElevatedButton(
                              child: const Text("Ok"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
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
