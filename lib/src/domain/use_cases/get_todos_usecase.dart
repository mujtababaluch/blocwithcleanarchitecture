import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/core/usecases/usecase.dart';
import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:blocwithcleanarchitecture/src/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class GetTodosUsecase implements UseCaseNo<List<TodoModel>> {
  final TodoRepository repository;

  GetTodosUsecase({required this.repository});
  @override
  Future<Either<Failure, List<TodoModel>>> invoke() async {
    return await repository.fetchTodos();
  }
}