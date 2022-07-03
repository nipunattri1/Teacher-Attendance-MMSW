import 'package:flutter/material.dart';
import 'package:teacher_attendance/controllers/get_leaves/get_rejected_leaves.dart';

Future<int> getRejectedLeavesInfo(BuildContext context) async {
  final docs = await getRejectedLeave();
  return docs.docs.length;
}
