import 'package:flutter/material.dart';
import 'package:teacher_attendance/controllers/get_leaves/get_approved_leaves.dart';

Future<int> getApprovedLeavesInfo(BuildContext context) async {
  final docs = await getApprovedLeave();
  return docs.docs.length;
}
