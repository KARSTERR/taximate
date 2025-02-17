import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'balance_page.dart';
import 'profile_page.dart';
import 'forgot_password_page.dart';
import 'onboarding_page.dart';
import 'register_page.dart';
import 'map_page.dart'; // Don't forget to import the MapPage
import 'bottom_nav_bar_page.dart'; // Import BottomNavBarPage

void main() {
  runApp(const TaxiMateApp());
}

class TaxiMateApp extends StatelessWidget {
  const TaxiMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaxiMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18), // Corrected textTheme usage
        ),
      ),
      initialRoute: '/', // The initial route
      routes: {
        '/': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(username: ''), // Placeholder for HomePage (empty username for now)
        '/balance': (context) => const BalancePage(),
        '/profile': (context) => const ProfilePage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/register': (context) => const RegisterPage(),
        '/map': (context) => const MapPage(), // Map page route
        '/bottom-nav': (context) => const BottomNavBarPage(), // Bottom Nav page route
      },
    );
  }
}
