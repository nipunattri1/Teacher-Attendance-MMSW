import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teacher_attendance/controllers/user_dashboard/get_approved_leaves_info.dart';
import 'package:teacher_attendance/controllers/user_dashboard/get_pending_leaves_info.dart';
import 'package:teacher_attendance/controllers/user_dashboard/get_rejected_leaves_info.dart';

Future<Map<String, int>> getAllLeavesInfo(BuildContext context) async {
  Map<String, int> result = {};
  await getApprovedLeavesInfo(context).then((value) {
    // result.putIfAbsent("key", () => null)
    result['approved'] = value;
  });
  await getPendingLeavesInfo(context).then((value) {
    result['pending'] = value;
  });
  await getRejectedLeavesInfo(context).then((value) {
    result['rejected'] = value;
  });
  log(result.toString());
  return result;
}
