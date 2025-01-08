import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> fetchTodos();
}
