import 'package:flutter/material.dart';

class CircularTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const CircularTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(height: 40, child: Image.asset(imagePath)));
  }
}
