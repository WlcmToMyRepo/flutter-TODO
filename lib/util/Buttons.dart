import 'package:flutter/material.dart';

class MDButton extends StatelessWidget {
  String? text;
  VoidCallback onPressed;
  MDButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text!));
  }
}

class DeleteButton extends StatelessWidget {
  VoidCallback onPressed;

  DeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.delete));
  }
}
