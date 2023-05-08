import 'package:flutter/material.dart';

class Constants {
  static const List<String> priorityName = ['Low', 'Normal', 'High'];
  static const List<Color> priorityColor = [
    Colors.blueAccent,
    Colors.orangeAccent,
    Color.fromARGB(255, 130, 25, 179),
  ];

  static Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return const Color.fromARGB(255, 130, 25, 179);
      case 'Normal':
        return Colors.orangeAccent;
      default:
        return Colors.blueAccent;
    }
  }
}
