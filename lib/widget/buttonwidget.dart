import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onclicked,
  });

  final String text;
  final VoidCallback onclicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclicked,
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      ),
    );
  }
}
