import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildSection(title: "Pins inspired by you", itemCount: 3),
          _buildSection(
              title:
                  "Violation notice. Visit your reports and violations centre for more information.",
              itemCount: 0),
          _buildSection(title: "Your home feed has new Pins", itemCount: 4),
          _buildSection(title: "Pins inspired by you", itemCount: 5),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required int itemCount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }
}
