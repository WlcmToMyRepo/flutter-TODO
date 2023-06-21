import 'package:flutter/material.dart';
import 'package:todo/util/Buttons.dart';

class ToDoDialog extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  ToDoDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Task"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MDButton(text: "save", onPressed: onSave),
                  const SizedBox(width: 8),
                  MDButton(text: "cancel", onPressed: onCancel),
                ],
              )
            ],
          )),
    );
  }
}
