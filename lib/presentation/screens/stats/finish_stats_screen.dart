import 'package:flutter/material.dart';

class FinishStatsScreen extends StatelessWidget {
  const FinishStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with dynamic data if available later
    final booksRead = 28;
    final booksSaved = 76;
    final readingGoal = 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookworm'),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.purpleAccent,
            child: Icon(Icons.person, color: Colors.white, size: 16),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Yaseen Adam',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Your 2025 Reading Journey'),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatCard(title: 'Books Read', count: booksRead),
                _StatCard(title: 'Books Saved', count: booksSaved),
              ],
            ),

            const SizedBox(height: 24),

            const Text('Annual Reading Goal'),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: booksRead / readingGoal,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              color: Colors.purple,
            ),
            const SizedBox(height: 8),
            Text('$booksRead / $readingGoal'),

            const SizedBox(height: 24),
            const Text(
              'Monthly Activity',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Replace with chart later
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  width: 20,
                  height: (index + 2) * 10,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int count;

  const _StatCard({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('$count', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
}
