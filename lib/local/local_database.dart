// the code below is used to create a class to act as a controller for performing
// the operations on our database

import 'package:bloc_example/model/to_do_model.dart';
import 'package:bloc_example/provider/database_provider.dart';

class DatabaseController {
  // the code below is used to create a property for accessing the database provider
  final dbClient = DatabaseProvider.dbProvider;

  // the code below is used to create a method to add a new task to our todo database
  Future<int> createTODO(TODOModel todo) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;
    // the code below is used to insert the data to the todo table using the insert
    // method and passing the instance of the TODOModel as input
    var result =
        db.insert("todoTable", todo.toJSON()); // here todoTable is the name of
    // the table in the database
    return result;
  }

  // the code below is used to create a method for getting the list of TODO Tasks
  // present in the database
  Future<List<TODOModel>> getAllTODOS({List<String>? columns}) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;
    // the code below is used to query the database
    var result = await db.query("todoTable", columns: columns);
    // the code below is used to create a list to check if the result is not empty
    // then getting the data from the database else returning empty list
    List<TODOModel> todos = result.isNotEmpty
        ? result.map((item) => TODOModel.fromJSON(item)).toList()
        : [];
    return todos;
  }

  // the code below is used to create a method to update the todoTable
  Future<int> updateTODO(TODOModel todo) async {
    // the code below is used to get access to the db getter
    final db = await dbClient.db;
    // the code below is used to update the todo table
    var result = await db.update("todoTable", todo.toJSON(),
        where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  //the method below is used to Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbClient.db;
    var result = await db.delete("todoTable", where: 'id = ?', whereArgs: [id]);

    return result;
  }
}
