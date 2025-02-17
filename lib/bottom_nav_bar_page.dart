import 'package:flutter/material.dart';
import 'home_page.dart';
import 'balance_page.dart';
import 'map_page.dart';
import 'profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  // List of pages to be shown for each tab
  final List<Widget> _pages = [
    const HomePage(username: '',),     // Home page
    const BalancePage(),  // Balance page
    const MapPage(),      // Map page (Placeholder)
    const ProfilePage(),  // Profile page
  ];

  // This function is triggered when an item is tapped in the BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body shows the selected page based on the index
      body: _pages[_selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the currently selected index
        onTap: _onItemTapped, // Callback when a tab is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
