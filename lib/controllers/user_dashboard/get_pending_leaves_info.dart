import 'package:flutter/material.dart';
import 'package:teacher_attendance/controllers/get_leaves/get_pending_leave.dart';

Future<int> getPendingLeavesInfo(BuildContext context) async {
  final docs = await getPendingLeaves(context);
  return docs.docs.length;
}
