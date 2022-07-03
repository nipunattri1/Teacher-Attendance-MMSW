import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';

onError(BuildContext context, StackTrace stackTrace, Object? error) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: Text("${error.toString()}\n${stackTrace.toString()}"),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

onTimeout(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: const Text("Connection Timeout"),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Future<void> applyLeave(LeaveDataModel leave, BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const AlertDialog(
      title: Text("Applying Leave"),
      content: SizedBox(
        height: 60,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    ),
  );

  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final String? displayName = FirebaseAuth.instance.currentUser?.displayName;
  final firestore = FirebaseFirestore.instance.collection("Pending Leaves");
  // await FirebaseFirestore.instance
  //     .collection("Teachers")
  //     .doc(uid)
  //     .collection("PL")
  //     .add(
  //   {
  //     "startDate": leave.startDate,
  //     "endDate": leave.endDate,
  //     "description": leave.description,
  //     "isHalfDay": leave.isHalfDay,
  //     "halfDayType": leave.halfDayType,
  //     "uid": uid,
  //     "displayName": displayName,
  //   },
  // ).catchError((error) => onError(context, StackTrace.current, error));

  await firestore
      .add(
        {
          "startDate": leave.startDate,
          "endDate": leave.endDate,
          "description": leave.description,
          "isHalfDay": leave.isHalfDay,
          "halfDayType": leave.halfDayType,
          "uid": uid,
          "displayName": displayName,
        },
      )
      .then(
        (value) {
          log("done");
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Leave Applied"),
              content: const Text("Your leave has been applied"),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("Ok"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        },
      )
      .onError((error, stackTrace) => onError(context, stackTrace, error))
      .timeout(
        const Duration(minutes: 3),
        onTimeout: () => onTimeout(context),
      );
}
