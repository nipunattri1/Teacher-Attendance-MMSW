import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:teacher_attendance/views/home/leave/leave_info/leave_slector.dart';

class LeaveApplyView extends StatelessWidget {
  const LeaveApplyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: SvgPicture.asset(
                "assets/svg/teacher.svg",
              ),
            ),
          ),
        ),
        // use intl to get the date format
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Today is ${DateFormat.yMMMMd().format(DateTime.now())} seems like a good day to apply for leave and take some rest/fun.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LeaveSelector(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Apply for Leave"),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
