// the code below is used to create a class that will act as an abstraction layer
// for the data source provider which is our local database
import 'package:bloc_example/local/local_database.dart';
import 'package:bloc_example/model/to_do_model.dart';

class Repository {
  // the code below is used to create an instance of the DatabaseController class
  final DatabaseController dbController = DatabaseController();

  Future getAllTodos() => dbController.getAllTODOS();

  Future insertTodo(TODOModel todo) => dbController.createTODO(todo);

  Future updateTodo(TODOModel todo) => dbController.updateTODO(todo);

  Future deleteTodo(int index) => dbController.deleteTodo(index);
}
