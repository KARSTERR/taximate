import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userName = "John Doe";
  final String userId = "1234567890";
  String avatarUrl = 'https://www.w3schools.com/w3images/avatar2.png'; // Placeholder avatar URL
  String travelType = "Alone";
  String conversationOption = "Silent";
  String preferredPaymentMethod = "Card";

  // Past rides - sample data
  List<PastRide> pastRides = [
    PastRide(
      date: DateTime(2024, 11, 12),
      destination: "Airport",
      distance: 25.0,
      fare: 150.0,
    ),
    PastRide(
      date: DateTime(2024, 10, 29),
      destination: "Downtown",
      distance: 12.5,
      fare: 75.0,
    ),
    PastRide(
      date: DateTime(2024, 9, 15),
      destination: "Mall",
      distance: 8.0,
      fare: 40.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Avatar and User Information
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ID: $userId',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Travel Options
            const Text(
              'Seyahat Tercihleri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildTravelOptionTile('Seyahat Türü', travelType),
            _buildTravelOptionTile('Konuşma Seçeneği', conversationOption),
            _buildTravelOptionTile('Ödeme Yöntemi', preferredPaymentMethod),
            const SizedBox(height: 24),

            // Past Rides
            const Text(
              'Geçmiş Yolculuklar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            if (pastRides.isEmpty)
              const Text(
                'Geçmiş yolculuk bulunmamaktadır.',
                style: TextStyle(fontSize: 16),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pastRides.length,
                itemBuilder: (context, index) {
                  final ride = pastRides[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yolculuk: ${ride.destination}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tarih: ${ride.date.day}/${ride.date.month}/${ride.date.year} - ${ride.date.hour}:${ride.date.minute}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Mesafe: ${ride.distance} km',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Ücret: ₺${ride.fare.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the travel option tiles
  Widget _buildTravelOptionTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// Model class for past rides
class PastRide {
  final DateTime date;
  final String destination;
  final double distance;
  final double fare;

  PastRide({
    required this.date,
    required this.destination,
    required this.distance,
    required this.fare,
  });
}
