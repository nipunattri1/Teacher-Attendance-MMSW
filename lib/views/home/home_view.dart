import 'package:flutter/material.dart';
import 'package:teacher_attendance/controllers/admin_verfication/admin_verifcation.dart';
import 'package:teacher_attendance/views/home/calander/calander_view.dart';
import 'package:teacher_attendance/views/home/dashboard/dashboard_view.dart';
import 'package:teacher_attendance/views/home/leave/leave_view.dart';
import 'package:teacher_attendance/views/home/pending%20leaves/pending_leaves.dart';
import 'package:teacher_attendance/views/home/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isAdmin = true;

  /// index of the current page in [_widgetOptions] and [_appBarOptions]
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: isAdmin(),
      initialData: false,
      builder: (context, snapshot) {
        bool data = snapshot.data ?? false;
        _isAdmin = data;
        var _widgetOptions = <Widget>[
          _isAdmin ? const PendingLeaves() : const DashBoardView(),
          const LeaveApplyView(),
          const SettingsView(),
        ];
        var _appBarOptions = <String>[
          _isAdmin ? "Leave Requests" : "Dashboard",
          "Apply for Leave",
          "",
        ];
        return Scaffold(
          /* The code above does the following, explained in English:
          If the user is an admin, and the selected index is 0, then show the FAB. */
          floatingActionButton: (_isAdmin && _selectedIndex == 0)
              ? ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                  onPressed: (() => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(title: const Text("My Stats")),
                            body: const DashBoardView(),
                          ),
                        ),
                      )),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.bar_chart),
                        ),
                        Text("My Stats"),
                      ],
                    ),
                  ),
                )
              : null,
          bottomNavigationBar: NavigationBar(
            height: kBottomNavigationBarHeight,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (idx) {
              setState(
                () {
                  _selectedIndex = idx;
                },
              );
            },

            /// Navigaton destinations for the bottom navigation bar
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                label: "Dashboard",
                selectedIcon: Icon(Icons.dashboard),
              ),
              NavigationDestination(
                icon: Icon(Icons.add),
                label: "Apply",
                selectedIcon: Icon(Icons.add_outlined),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: "Settings",
                selectedIcon: Icon(Icons.person),
              ),
            ],
          ),
          appBar: AppBar(
            title: Text(_appBarOptions[_selectedIndex]),
            actions: data && _selectedIndex == 0
                ? [
                    IconButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CalanderView(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.date_range,
                      ),
                    ),
                  ]
                : null,
          ),
          body: _widgetOptions[_selectedIndex],
        );
      },
    );
  }
}
