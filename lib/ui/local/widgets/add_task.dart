import 'package:bloc_example/bloc/to_do_bloc/todo_bloc.dart';
import 'package:bloc_example/model/to_do_model.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // getting the task name
  String? taskName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        TextField(
          decoration: const InputDecoration(
            hintText: "Enter Task",
          ),
          onChanged: (value) {
            setState(() {
              taskName = value;
            });
          },
        ),
        const SizedBox(
          height: 25.0,
        ),
        MaterialButton(
            child: Container(
              width: 200.0,
              height: 50.0,
              color: Colors.deepPurpleAccent,
              child: const Center(
                child: Text(
                  "Add",
                ),
              ),
            ),
            onPressed: () {
              todoBloc.addTodo(TODOModel(
                title: taskName,
                done: false,
              ));

              Navigator.pop(context);
            }),
      ],
    );
  }
}
