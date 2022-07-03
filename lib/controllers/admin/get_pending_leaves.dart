import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getAllPendingLeaves() {
  final firebase = FirebaseFirestore.instance.collection("Pending Leaves");
  return firebase.get();
}
