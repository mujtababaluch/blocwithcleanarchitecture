import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';

abstract class TodoState {

}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}