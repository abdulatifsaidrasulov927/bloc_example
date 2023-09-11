// the code below is used to create a class to write the business logic for our todo project
import 'package:bloc_example/model/to_do_model.dart';
import 'package:bloc_example/reppostory/local/repostory_local.dart';
import 'package:rxdart/rxdart.dart';

class TODOBloc {
  // the code below is used to create an instance of the repository class
  final Repository repository = Repository();

  // the code below is used to create an instance of the publish subject class
  final PublishSubject<List<TODOModel>> _todoFetcher =
      PublishSubject<List<TODOModel>>();

  // the code below is used to create a getter for getting of type Stream<TODOModel> for
  // getting the stream from PublishSubject()
  Stream<List<TODOModel>> get allTODOS => _todoFetcher.stream;

  // the code below is used to create an instance of the TODOBloc
  TODOBloc() {
    // the code below is used to call the getAllTODOs method
    getAllTODOs();
  }

  // the code below is used to create a method to get all the todos
  getAllTODOs() async {
    List<TODOModel> todo = await repository.getAllTodos();
    _todoFetcher.sink.add(todo);
  }

  // the code below is used to create a method to add the TODOs
  addTodo(TODOModel todo) async {
    await repository.insertTodo(todo);
    getAllTODOs();
  }

  // the code below is used to update the todos
  updateTodo(TODOModel todo) async {
    repository.updateTodo(todo);
    getAllTODOs();
  }

  // the code below is used to delete the TODO
  deleteTodo(int id) async {
    repository.deleteTodo(id);
    getAllTODOs();
  }
}

final todoBloc = TODOBloc();
