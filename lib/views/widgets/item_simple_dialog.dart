import 'package:flutter/material.dart';

class ItemSimpleDialog extends StatelessWidget {
  IconData icon;
  VoidCallback press;
  String label;
  ItemSimpleDialog({
    super.key,
    required this.icon,
    required this.press,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: press,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
