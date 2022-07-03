// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'package:teacher_attendance/controllers/get_leaves/get_approved_leaves.dart';
import 'package:teacher_attendance/controllers/get_leaves/get_pending_leave.dart';
import 'package:teacher_attendance/controllers/get_leaves/get_rejected_leaves.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';
import 'package:teacher_attendance/views/requests/request_details.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Requests"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Approved"),
              Tab(text: "Rejected"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: getPendingLeaves(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.data != null &&
                    snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Lottie.asset("assets/lottie/no-result.json"),
                  );
                }
                return List(data: snapshot.data);
              },
            ),
            // Text("Pending"),
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.data != null &&
                    snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Lottie.asset("assets/lottie/no-result.json"),
                  );
                } else {
                  return List(data: snapshot.data);
                }
              }),
              future: getApprovedLeave(),
            ),
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.data != null &&
                    snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Lottie.asset("assets/lottie/no-result.json"),
                  );
                } else {
                  return List(data: snapshot.data);
                }
              }),
              future: getRejectedLeave(),
            ),
          ],
        ),
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({
    Key? key,
    required this.data,
  }) : super(key: key);
  final QuerySnapshot<Map<String, dynamic>>? data;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data?.docs.map(
            (e) {
              final LeaveDataModel model = LeaveDataModel.fromMap(e.data());
              return ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RequestDetailsView(
                      leave: LeaveDataModel.fromMap(
                        e.data(),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  model.isMultipleDays
                      ? "${DateFormat.yMMMMd().format(model.startDate)} - ${DateFormat.yMMMMd().format(model.endDate)}"
                      : DateFormat.yMMMMd().format(model.startDate),
                ),
              );
            },
          ).toList() ??
          [],
    );
  }
}
