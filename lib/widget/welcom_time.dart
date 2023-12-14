import 'package:flutter/material.dart';

class WelcomeTime extends StatelessWidget {
  const WelcomeTime({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    int hour = currentTime.hour;

    String greeting = (hour < 12)
        ? 'Good Morning'
        : (hour < 18)
            ? 'Good day'
            : 'Good afternoon';

    return Text(
      greeting,
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
  }
}
