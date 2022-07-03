import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getPendingLeaves(
    BuildContext context) async {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final firestore = FirebaseFirestore.instance
      .collection("Pending Leaves")
      .where("uid", isEqualTo: uid);

  return await firestore.get();
}
