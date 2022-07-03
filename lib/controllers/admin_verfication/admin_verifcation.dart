import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool?> isAdmin() async {
  bool? _isAdmin = false;
  final firebase = FirebaseFirestore.instance.collection("Teachers");
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  await firebase.doc(uid).get().then((value) {
    final data = value.data();
    if (data != null && data.containsKey("isAdmin")) {
      _isAdmin = data["isAdmin"] as bool?;
    }
  });
  return _isAdmin;
}
