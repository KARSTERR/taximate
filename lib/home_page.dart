import 'package:flutter/material.dart';
import 'balance_page.dart'; // Assuming BalancePage is defined
import 'map_page.dart'; // Assuming MapPage is defined
import 'profile_page.dart'; // Assuming ProfilePage is defined

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tracks the currently selected index for the bottom navigation bar

  // Sample data for available taxis
  final List<Taxi> taxis = [
    Taxi(plateNumber: '34ABC123', destination: 'Eiffel Tower', available: true),
    Taxi(plateNumber: '06XYZ987', destination: 'Louvre Museum', available: false),
    Taxi(plateNumber: '35DEF456', destination: 'Notre Dame', available: true),
    Taxi(plateNumber: '01GHI789', destination: 'Sacré-Cœur', available: true),
  ];

  final List<Widget> _pages = [
    // Add your pages for bottom navigation here
    const HomePageContent(),
    const BalancePage(),
    const MapPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaxiMate'),
      ),
      body: _pages[_currentIndex], // Switch content based on the selected bottom nav item
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected page
          });
        },
        backgroundColor: Colors.black, // Set background color to black
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming `HomePage` will include a username greeting and taxi cards
    final String username = 'User'; // Example username
    final List<Taxi> taxis = [
      Taxi(plateNumber: '34ABC123', destination: 'Eiffel Tower', available: true),
      Taxi(plateNumber: '06XYZ987', destination: 'Louvre Museum', available: false),
      Taxi(plateNumber: '35DEF456', destination: 'Notre Dame', available: true),
      Taxi(plateNumber: '01GHI789', destination: 'Sacré-Cœur', available: true),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Hoş Geldiniz, $username!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'Mevcut Taksiler',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: taxis.length,
              itemBuilder: (context, index) {
                final taxi = taxis[index];
                return TaxiCard(taxi: taxi);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Taxi {
  final String plateNumber;
  final String destination;
  final bool available;

  Taxi({
    required this.plateNumber,
    required this.destination,
    required this.available,
  });
}

class TaxiCard extends StatelessWidget {
  final Taxi taxi;

  const TaxiCard({super.key, required this.taxi});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plaka: ${taxi.plateNumber}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Hedef: ${taxi.destination}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Durum: ${taxi.available ? 'Mevcut' : 'Mevcut Değil'}',
              style: TextStyle(
                fontSize: 16,
                color: taxi.available ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: taxi.available
                  ? () {
                // Show an in-app notification (SnackBar) when the taxi is called
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Taksi ${taxi.plateNumber} sizi almaya geliyor!',
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: taxi.available ? Colors.green : Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Taksi Çağır'),
            ),
          ],
        ),
      ),
    );
  }
}
