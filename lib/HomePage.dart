import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'EarnedScreen.dart';
import 'GoalScreen.dart';
import 'SpentScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0; // Track the currently selected index

  final List<Widget> _screens = [
    EarnedScreen(),
    SpentScreen(),
    GoalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список желаний'),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.deepPurple.shade100,
        tabBackgroundColor: Colors.deepPurple.shade200,
        padding: const EdgeInsets.all(15),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.arrow_circle_down,
            text: "Заработано",
          ),
          GButton(
            icon: Icons.arrow_circle_up,
            text: "Потрачено",
          ),
          GButton(
            icon: Icons.star_border,
            text: "Цель",
          )
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
