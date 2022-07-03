import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> approveLeave(String docID) async {
  /// Firestore instance for the application
  final FirebaseFirestore firestoreRef = FirebaseFirestore.instance;

  /// Collection refference to the collection of Leaves Left to be approved.
  /// This reffence will be used to get the data to to be transfered
  /// and delete from pending leaves collection
  final CollectionReference<Map<String, dynamic>> pendingCollectionRef =
      firestoreRef.collection("Pending Leaves");

  /// reffernce to the specific leave which needs to be approved.
  final DocumentSnapshot<Map<String, dynamic>> leave =
      await pendingCollectionRef.doc(docID).get();

  /// get the data of the leave to be approved
  final Map<String, dynamic>? leaveData = leave.data();

  /// List of all approved leaves by all users
  final CollectionReference<Map<String, dynamic>> approvedCollectionRef =
      firestoreRef.collection("Approved Leaves");

  /// Collection refference to the collection of Leaves  approved for a particular user .
  final CollectionReference<Map<String, dynamic>> teachersALCollectionRef =
      firestoreRef
          .collection("Teachers")
          .doc(leaveData!["uid"])
          .collection("AL");

  /// update approved list of particular user.
  await teachersALCollectionRef.doc(docID).set({
    ...leaveData,
    "approvedBy": FirebaseAuth.instance.currentUser!.displayName,
  });
  await approvedCollectionRef.doc(docID).set({
    ...leaveData,
    "approvedBy": FirebaseAuth.instance.currentUser!.displayName,
  });

  /// delete the leave from pending leaves collection.
  await pendingCollectionRef.doc(docID).delete();
}
