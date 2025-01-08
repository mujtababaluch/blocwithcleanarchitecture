import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class TodoDataSource {
  Future<Either<Failure ,List<TodoModel>>> getTodos();
}