import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getApprovedLeave() async {
  final firebase = FirebaseFirestore.instance.collection("Teachers");
  final user = FirebaseAuth.instance.currentUser;
  return await firebase
      .doc(user!.uid)
      .collection("AL")
      .where("endDate",
          isGreaterThanOrEqualTo: DateTime(
            DateTime.now().year,
          ))
      .get();
}
