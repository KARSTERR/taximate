import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  double balance = 0.0;
  final List<String> balanceLog = [];

  void _addBalance() {
    setState(() {
      balance += 1000.0;
      balanceLog.insert(0, '₺1000 eklendi');
    });
  }

  void _callTaxi() {
    setState(() {
      balance -= 50.0; // Assuming calling a taxi costs 50 TL
      balanceLog.insert(0, 'Taksi çağrıldı - ₺50');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bakiye'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Mevcut Bakiye: ₺${balance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addBalance,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // This was 'primary' before
                foregroundColor: Colors.white, // This was 'onPrimary' before
              ),
              child: const Text('₺1000 Ekle'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _callTaxi,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Taxi button style
                foregroundColor: Colors.white,
              ),
              child: const Text('Taksi Çağır'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Bakiye Geçmişi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: balanceLog.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(balanceLog[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
