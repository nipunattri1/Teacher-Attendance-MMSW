import 'package:flutter/material.dart';
import "package:fl_chart/fl_chart.dart";
import 'package:teacher_attendance/controllers/user_dashboard/get_all_info.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: getAllLeavesInfo(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            final data = snapshot.data as Map<String, int>;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: ((data["approved"] ?? 0) +
                                      (data["pending"] ?? 0) +
                                      (data["rejected"] ?? 0) !=
                                  0)
                              ? AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 40,
                                      sections: showingSections(
                                        data["approved"] ?? 0,
                                        data["pending"] ?? 0,
                                        data["rejected"] ?? 0,
                                      ),
                                    ),
                                  ))
                              : const Center(child: Text("No Data")),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Indicator(
                                color: Colors.green,
                                text: 'Approved Leaves',
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Color(0xfff8b250),
                                text: 'Pending Leaves',
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Indicator(
                                color: Colors.red,
                                text: 'Rejected Leaves',
                              ),
                              SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4 -
                          kToolbarHeight -
                          16 -
                          kBottomNavigationBarHeight,
                      width: MediaQuery.of(context).size.width * 0.5 - 16,
                      child: Card(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You have ${10 - (data["approved"] ?? 0)} Leaves Left for this year",
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4 -
                          kToolbarHeight -
                          16 -
                          kBottomNavigationBarHeight,
                      width: MediaQuery.of(context).size.width * 0.5 - 16,
                      child: Card(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You have ${data["pending"] ?? 0} Leaves pending..",
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  List<PieChartSectionData> showingSections(
      int approved, int pending, int rejected) {
    return List.generate(3, (i) {
      const fontSize = 16.0;
      const radius = 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: approved.toDouble(),
            title: '$approved',
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: pending.toDouble(),
            title: pending.toString(),
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: rejected.toDouble(),
            title: '$rejected',
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 20,
            width: 20,
            color: color,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(text),
        ],
      ),
    );
  }
}
