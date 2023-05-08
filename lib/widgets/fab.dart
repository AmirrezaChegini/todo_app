import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      label: Text(label),
      backgroundColor: const Color.fromARGB(255, 130, 25, 179),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      splashColor: Colors.transparent,
    );
  }
}
