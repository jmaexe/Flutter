import 'package:flutter/material.dart';
import 'package:snap_lang/screens/home_screen.dart';
import 'package:snap_lang/screens/profile_screen.dart';
import 'package:snap_lang/screens/settings_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int index) onTap;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List _pages = [
    {
      "icon": Icons.home_outlined,
      "activeIcon": Icons.home_filled,
      "label": "Home",
    },
    {
      "icon": Icons.settings_outlined,
      "activeIcon": Icons.settings,
      "label": "Settings",
    },
    {
      "icon": Icons.person_outlined,
      "activeIcon": Icons.person,
      "label": "Profile",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (int index) {
        widget.onTap(index);
      },
      items: _pages.map((page) {
        return BottomNavigationBarItem(
          icon: Icon(page["icon"]),
          activeIcon: Icon(page["activeIcon"]),
          label: page["label"],
        );
      }).toList(),
    );
  }
}
