import 'package:bloc_example/bloc/to_do_bloc/todo_bloc.dart';
import 'package:bloc_example/model/to_do_model.dart';
import 'package:bloc_example/ui/local/widgets/add_task.dart';
import 'package:flutter/material.dart';

// the code below is used to create the todo screen of the app
class TODOScreen extends StatelessWidget {
  const TODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // the code below is used to call the getAllTODOs method to get all the TODOs
    // from the database
    todoBloc.getAllTODOs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: StreamBuilder<List<TODOModel>>(
        stream: todoBloc.allTODOS,
        builder: (context, AsyncSnapshot<List<TODOModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].title.toString(),
                    style: TextStyle(
                      decoration: snapshot.data![index].done!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: const Text(
                    "Tap on the task to delete the task",
                  ),
                  onTap: () {
                    // the method below is used to delete the task from the database
                    todoBloc.deleteTodo(snapshot.data![index].id!.toInt());
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            // the code below is used to print the error on the screen
            return Text(snapshot.error.toString());
          } else if (snapshot.data == null) {
            return const Center(
              child: Text(
                "Enter your first task",
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddTask();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
