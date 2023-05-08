import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget with PreferredSizeWidget {
  const EditAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: const BackButton(color: Colors.black),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      title: const Text(
        'Edit Task',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
