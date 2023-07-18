import 'package:flutter/material.dart';

class CustomBottomCard extends StatelessWidget {
  final String data;
  final String title;
  const CustomBottomCard({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
          Text(
            data,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
