import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher_attendance/controllers/apply_leave/appy_leave.dart';
import 'package:teacher_attendance/model/leave/leave_model.dart';

enum DayType { start, end }

class LeaveSelector extends StatefulWidget {
  const LeaveSelector({Key? key}) : super(key: key);

  @override
  State<LeaveSelector> createState() => _LeaveSelectorState();
}

class _LeaveSelectorState extends State<LeaveSelector> {
  String _leaveType = "One Day Leave";
  String _reason = "";
  DateTimeRange? _dateRange;
  DateTime? _leaveDate;
  bool _isMorning = true;

  DateTime calcDate(DayType type) {
    if (type == DayType.start) {
      if (_leaveType != "Multiple Days Leave") {
        return _leaveDate!;
      } else {
        return _dateRange!.start;
      }
    } else {
      if (_leaveType != "Multiple Days Leave") {
        return _leaveDate!;
      } else {
        return _dateRange!.end;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: (_reason != "" &&
              ((_dateRange != null && _leaveType == "Multiple Days Leave") ||
                  (_leaveType != "Multiple Days Leave" && _leaveDate != null)))
          ? FloatingActionButton(
              onPressed: () async {
                await applyLeave(
                  LeaveDataModel(
                    description: _reason,
                    startDate: calcDate(DayType.start),
                    endDate: calcDate(DayType.end),
                    halfDayType: (_isMorning) ? "Morning" : null,
                    isHalfDay: _leaveType == "Half Day Leave",
                    isMultipleDays: _leaveType == "Multiple Days Leave",
                  ),
                  context,
                );
              },
              child: const Icon(Icons.check),
            )
          : null,
      appBar: AppBar(
        title: const Text(
          "Leave Info",
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Please input the follwing info",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: const Text(
                      "Leave Type",
                    ),
                    trailing: DropdownButton<String>(
                      value: _leaveType,
                      items: [
                        DropdownMenuItem(
                          value: "One Day Leave",
                          child: const Text("One Day Leave"),
                          onTap: () {
                            setState(
                              () {
                                _leaveType = "One Day Leave";
                              },
                            );
                          },
                        ),
                        DropdownMenuItem(
                          value: "Half Day Leave",
                          child: const Text("Half Day Leave"),
                          onTap: () {
                            setState(
                              () {
                                _leaveType = "Half Day Leave";
                              },
                            );
                          },
                        ),
                        DropdownMenuItem(
                          value: "Multiple Days Leave",
                          child: const Text("Multiple Days Leave"),
                          onTap: () {
                            setState(
                              () {
                                _leaveType = "Multiple Days Leave";
                              },
                            );
                          },
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: Text(
                      _leaveType == "Multiple Days Leave"
                          ? _dateRange != null
                              ? "${DateFormat.yMMMMd().format(_dateRange!.start)} - ${DateFormat.yMMMMd().format(_dateRange!.end)}"
                              : "Select Dates for Leaves"
                          : _leaveDate != null
                              ? DateFormat.yMMMEd().format(_leaveDate!)
                              : "Select Date for Leave",
                    ),
                    trailing: ElevatedButton(
                      onPressed: () async {
                        if (_leaveType == "Multiple Days Leave") {
                          await showDateRangePicker(
                            context: context,
                            initialDateRange: _dateRange,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(
                                days: 30,
                              ),
                            ),
                          ).then(
                            (value) => setState(
                              () => _dateRange = value,
                            ),
                          );
                        } else {
                          await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(
                                days: 30,
                              ),
                            ),
                          ).then(
                            (value) {
                              setState(
                                () {
                                  _leaveDate = value;
                                },
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        _leaveType == "Multiple Days Leave"
                            ? "Select Dates"
                            : "Select Date",
                      ),
                    ),
                  ),
                  if (_leaveType == "Half Day Leave")
                    Container(
                      height: 75,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                _isMorning = true;
                              }),
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: _isMorning
                                      ? Theme.of(context).cardColor
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                duration: const Duration(milliseconds: 300),
                                child: const Center(
                                  child: Text(
                                    "Morning",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () => setState(() {
                                _isMorning = false;
                              }),
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(4),
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: !_isMorning
                                      ? Theme.of(context).cardColor
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Afternoon",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Please input reason for leave";
                          }
                          return null;
                        },
                        maxLength: 200,
                        maxLines: 8,
                        onChanged: (val) => setState(
                          () {
                            _reason = val;
                          },
                        ),
                        decoration: const InputDecoration(
                          labelText: "Leave Reason",
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
