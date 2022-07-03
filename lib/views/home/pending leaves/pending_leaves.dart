import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_attendance/controllers/admin/get_pending_leaves.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';
import 'package:teacher_attendance/views/requests/request_details.dart';

class PendingLeaves extends StatelessWidget {
  const PendingLeaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: getAllPendingLeaves(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.data != null && snapshot.data!.docs.isEmpty) {
          return Center(
            child: Lottie.asset("assets/lottie/no-result.json"),
          );
        }
        return Card(
          child: List(
            data: snapshot.data,
          ),
        );
      },
    );
  }
}

class List extends StatelessWidget {
  const List({
    Key? key,
    required this.data,
    this.explicitAdmin = false,
  }) : super(key: key);
  final QuerySnapshot<Map<String, dynamic>>? data;
  final bool explicitAdmin;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data?.docs.map((e) {
            final LeaveDataModel model = LeaveDataModel.fromMap(e.data());
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RequestDetailsView(
                        leave: LeaveDataModel.fromMap(
                          e.data(),
                        ),
                        isAdmin: explicitAdmin ? false : true,
                        docID: e.id,
                      ),
                    ),
                  ),
                  title: Text(model.displayName ?? "User Name Not found"),
                  subtitle: Text(
                    model.isMultipleDays
                        ? "${DateFormat.yMMMMd().format(model.startDate)} - ${DateFormat.yMMMMd().format(model.endDate)}"
                        : DateFormat.yMMMMd().format(model.startDate),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            );
          }).toList() ??
          [],
    );
  }
}
