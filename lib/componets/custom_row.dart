import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final List<Widget> children;
  const CustomRow({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }
}
