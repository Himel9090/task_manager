import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/NewTaskScreen.dart';
import 'package:task_manager/UI/Screens/Progress_Screen.dart';

import 'package:task_manager/UI/weidgets/TM%20AppBar.dart';

class MainNavbarHolderScreen extends StatefulWidget {
  const MainNavbarHolderScreen({super.key});

  @override
  State<MainNavbarHolderScreen> createState() => _MainNavbarHolderScreenState();
}

class _MainNavbarHolderScreenState extends State<MainNavbarHolderScreen> {
  int _selectedindex = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    Progresstaskscreen(),
    Progresstaskscreen(),
    Progresstaskscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedindex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedindex,
        onDestinationSelected: (int index) {
          _selectedindex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New Task'),
          NavigationDestination(
            icon: Icon(Icons.done_all_outlined),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Cancled',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_upward_outlined),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
