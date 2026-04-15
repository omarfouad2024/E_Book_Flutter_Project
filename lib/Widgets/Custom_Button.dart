import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String name;
  final Color background;
  final Color foreground;

  const CustomElevatedButton({
    super.key,
    required this.name,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 13),
        ),
        onPressed: () {},
        child: Text(name),
      ),
    );
  }
}
