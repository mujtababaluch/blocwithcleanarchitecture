import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:blocwithcleanarchitecture/src/domain/data_sources/todo_data_source.dart';
import 'package:blocwithcleanarchitecture/src/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
class TodoRepositoryImpl implements TodoRepository  {
  TodoDataSource dataSource;
  TodoRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<TodoModel>>> fetchTodos() async {
    final response = await dataSource.getTodos();
    return response.fold(
      (failure) =>left(failure),
      (register){
        if(register.isNotEmpty){
          return Right(register);
        }
        return const Left(Failure('api failed to call'));
      },
    );
  }
}