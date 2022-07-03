import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_attendance/controllers/ranged%20leaves/get_ranged_leaves.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';
import 'package:teacher_attendance/views/requests/request_details.dart';

class CalanderView extends StatefulWidget {
  const CalanderView({Key? key}) : super(key: key);

  @override
  State<CalanderView> createState() => _CalanderViewState();
}

class _CalanderViewState extends State<CalanderView> {
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedDateRange == null
            ? 'Select Date'
            : "${DateFormat.yMMMd().format(_selectedDateRange!.start)} - ${DateFormat.yMMMd().format(_selectedDateRange!.end)}"),
      ),
      body: _selectedDateRange == null
          ? Center(
              child: ElevatedButton(
                child: const Text("Open Calander"),
                onPressed: () {
                  showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2022, 6),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 30,
                      ),
                    ),
                  ).then((value) => setState(() => _selectedDateRange = value));
                },
              ),
            )
          : Column(
              children: [
                ElevatedButton(
                  child: const Text("Open Calander"),
                  onPressed: () {
                    showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2022, 6),
                      lastDate: DateTime.now().add(
                        const Duration(
                          days: 30,
                        ),
                      ),
                    ).then(
                        (value) => setState(() => _selectedDateRange = value));
                  },
                ),
                FutureBuilder(
                  future: getRangedLeaves(
                      _selectedDateRange!.start, _selectedDateRange!.end),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Lottie.asset("assets/lottie/no-result.json");
                    }
                    return Expanded(
                      child: Card(
                        child: _List(
                          data: snapshot.data as List<
                              QueryDocumentSnapshot<Map<String, dynamic>>>,
                          explicitAdmin: true,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    Key? key,
    required this.data,
    this.explicitAdmin = false,
  }) : super(key: key);
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  final bool explicitAdmin;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((e) {
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
      }).toList(),
    );
  }
}
