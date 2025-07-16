import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      body: Center(
        child: Text(
          '👤 Profile Screen (Coming Soon)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
