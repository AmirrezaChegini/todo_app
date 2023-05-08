import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onChnaged,
  });

  final Function(String value) onChnaged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56,
      title: const Text(
        'To Do List',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 130, 25, 179),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(-200),
            colors: [
              Colors.white,
              Color.fromARGB(255, 130, 25, 179),
              Color.fromARGB(255, 130, 25, 179),
            ],
          ),
        ),
        child: TextField(
          onChanged: (value) => onChnaged(value),
          autofocus: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.grey,
            hintText: 'Search Tasks',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
