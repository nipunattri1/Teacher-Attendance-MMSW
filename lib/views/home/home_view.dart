import 'package:flutter/material.dart';
import 'package:teacher_attendance/views/dashboard/dashboard_view.dart';
import 'package:teacher_attendance/views/leave/leave_view.dart';
import 'package:teacher_attendance/views/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // TODO: use hive to get [_isAdmin] value

  bool _isAdmin = false;

  /// index of the current page in [_widgetOptions] and [_appBarOptions]
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  late List<String> _appBarOptions;
  @override
  void initState() {
    /// initalize the [_widgetOptions] and [_appBarOptions]
    _widgetOptions = <Widget>[
      _isAdmin ? Container() : const DashBoardView(),
      const LeaveApplyView(),
      const SettingsView(),
    ];
    _appBarOptions = <String>[
      _isAdmin ? "Leave Requests" : "Dashboard",
      "Apply for Leave",
      "",
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* The code above does the following, explained in English:
      If the user is an admin, and the selected index is 0, then show the FAB. */
      floatingActionButton: (_isAdmin && _selectedIndex == 0)
          ? ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
              onPressed: (() => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text("My Stats")),
                        body: DashBoardView(),
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
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
