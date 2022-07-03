import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_attendance/controllers/admin/approve_leave.dart';
import 'package:teacher_attendance/controllers/admin/deny_leave.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';

class RequestDetailsView extends StatefulWidget {
  const RequestDetailsView({
    Key? key,
    required this.leave,
    this.isAdmin = false,
    this.docID,
    this.approvedLeave,
    this.rejectedLeaveModel,
  }) : super(key: key);
  final LeaveDataModel leave;
  final ApprovedLeaveModel? approvedLeave;
  final RejectedLeaveModel? rejectedLeaveModel;
  final bool isAdmin;
  final String? docID;

  @override
  State<RequestDetailsView> createState() => _RequestDetailsViewState();
}

class _RequestDetailsViewState extends State<RequestDetailsView> {
  bool really = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave Info"),
      ),
      bottomNavigationBar: widget.isAdmin && widget.docID != null
          ? SizedBox(
              height: kBottomNavigationBarHeight,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Are you sure?"),
                          content: const Text(
                              "Do you really want to Reject this leave."),
                          actions: <Widget>[
                            OutlinedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("NO")),
                            ElevatedButton(
                              child: const Text("YES"),
                              onPressed: () {
                                setState(() {
                                  really = true;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                      if (really) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("Rejecting Leave"),
                                content: SizedBox(
                                  height: 60,
                                  child: Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                              );
                            });
                        rejectLeave(widget.docID!).then(
                          (value) => Navigator.of(context)
                            ..pop()
                            ..pop(),
                        );
                      }
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.cancel),
                        ),
                        Text("Deny Request"),
                      ],
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Approving Leave"),
                              content: SizedBox(
                                height: 60,
                                child: Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              ),
                            );
                          });
                      approveLeave(widget.docID!)
                          .then((value) => Navigator.of(context)
                            ..pop()
                            ..pop());
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.check),
                        ),
                        Text("Approve Request"),
                      ],
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.leave.isHalfDay && widget.leave.halfDayType != null
                  ? ("Half Day Leave in ${widget.leave.halfDayType}")
                  : widget.leave.isMultipleDays
                      ? "Multiple Days leave"
                      : "Single Day Leave",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(widget.leave.isMultipleDays
                  ? "from ${DateFormat.yMMMMd().format(widget.leave.startDate)} to ${DateFormat.yMMMMd().format(widget.leave.endDate)}"
                  : "on ${DateFormat.yMMMMd().format(widget.leave.startDate)}"),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 16),
              color: Colors.white.withOpacity(.2),
              child: Text(widget.leave.description),
            ),
          ],
        ),
      ),
    );
  }
}
