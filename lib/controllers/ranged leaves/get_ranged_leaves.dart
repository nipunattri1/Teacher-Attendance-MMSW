import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getRangedLeaves(
  DateTime start,
  DateTime end,
) async {
  final approvedCollectionRef =
      FirebaseFirestore.instance.collection("Approved Leaves");
  final endDate = await approvedCollectionRef
      .where("endDate", isLessThanOrEqualTo: Timestamp.fromDate(end))
      .get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> endDocs = [...endDate.docs];
  endDocs.retainWhere(
    (e) => (e.data()["startDate"] as Timestamp).toDate().isAfter(
          start.add(
            const Duration(days: -1),
          ),
        ),
  );
  return endDocs;
}
