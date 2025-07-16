import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();

  debugPrint("🟢 SplashScreen initState called");

  Future.delayed(Duration.zero, () {
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint("⏱ Navigating to login...");
      if (mounted) {
        context.go('/login');
      }
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text(
          '📚 Book Explorer',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
