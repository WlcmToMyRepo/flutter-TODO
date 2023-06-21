import 'package:flutter/material.dart';
import 'package:todo/pages/todo_tiles.dart';
import '../util/todo_dialog.dart';
import '../database/rough.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final list = Hive.box("todolist");
  final db = ToDoList();
  final _controller = TextEditingController();

  void changeTaskStatus(bool? value, int index) {
    setState(() {
      print("\n\nValue obtained from checkbox $value \n\n");
      db.dummy[index][1] = value;
      db.updateList();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ToDoDialog(
              controller: _controller,
              onSave: () {
                setState(() {
                  print("TEXT OF CONTROLLER ${_controller.text}");

                  db.dummy.add([_controller.text, false]);
                  db.updateList();
                  _controller.text = "";
                });
                Navigator.of(context).pop();
              },
              onCancel: () {
                Navigator.of(context).pop();
              });
        });
  }

  void deleteTask(index) {
    setState(() {
      db.dummy.removeAt(index);
      db.updateList();
    });
  }

  @override
  void initState() {
    // init state methods refers to the state when the app is opened

    // need to check if the data base has some to do list

    // TODO: implement initState

    if (list.get("data") == null) {
      // list has got not data
      db.initiateList();
    } else {
      // list has got the previous data so load them
      db.fetchList();
    }
    super.initState();
  }

  @override
  void dispose() {
    dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // returns scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO-DO",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.yellow[200],

      // this is a floating action button which adds new to do item
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: const Icon(Icons.add)),

      // list view holds content as todo tile

      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.dummy[index][0],
              taskCompleted: db.dummy[index][1],
              onChanged: (value) => changeTaskStatus(value, index),
              onDelete: () {
                deleteTask(index);
              });
        },
        itemCount: db.dummy.length,
      ),
    );
  }
}
