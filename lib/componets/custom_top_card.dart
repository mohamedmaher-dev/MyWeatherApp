import 'package:flutter/material.dart';

class CustomTopCard extends StatelessWidget {
  final IconData icon;
  final String data;
  final String title;
  const CustomTopCard({
    super.key,
    required this.data,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white70),
          Text(
            data,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
