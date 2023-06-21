// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/util/Buttons.dart';

class ToDoTile extends StatelessWidget {
  String? taskName;
  bool? taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback onDelete;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
            SizedBox(
              width: 230,
              child: Text(
                taskName!,
                style: TextStyle(
                  fontSize: 20,
                  decoration: taskCompleted!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            DeleteButton(onPressed: onDelete)
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
