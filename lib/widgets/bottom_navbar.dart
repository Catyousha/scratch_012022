import 'package:flutter/material.dart';
import 'package:scratch_012022/routes/routes.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  final int currentIndex;

  final List _route = [
    () => SubRoutes.key.currentState!.pushNamed(
          SubRoutes.home,
        ),
    () => SubRoutes.key.currentState!.pushNamed(
          SubRoutes.profile,
        ),
    () => SubRoutes.key.currentState!.pushNamed(
          SubRoutes.settings,
        ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (val) {
        _route[val]();
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
