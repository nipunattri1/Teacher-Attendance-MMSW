import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

Future<void> addUserData(BuildContext context) async {
  Future.delayed(const Duration(seconds: 2));
  final firestore = FirebaseFirestore.instance.collection("Teachers");
  final User? user = FirebaseAuth.instance.currentUser;
  final doc = await firestore.doc(user!.uid).get();
  if ((doc.exists || !user.email!.endsWith("@manavmangalschool.com")) &&
      !kDebugMode) return;
  log("we did add");
  return await firestore.doc(user.uid).set(
    {
      "username": user.displayName,
      "email": user.email,
      "photoUrl": user.photoURL,
      "isAdmin": false,
    },
  ).then(
    (value) => Navigator.of(context).pop(),
  );
}
