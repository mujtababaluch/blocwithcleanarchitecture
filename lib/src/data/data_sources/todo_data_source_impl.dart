import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/core/utils/url_constants.dart';
import 'package:blocwithcleanarchitecture/src/data/api/result.dart';
import 'package:blocwithcleanarchitecture/src/data/models/todo_models.dart';
import 'package:blocwithcleanarchitecture/src/domain/data_sources/todo_data_source.dart';
import 'package:dartz/dartz.dart';

import '../api/dio_client.dart';

class TodoDataSourceImpl implements TodoDataSource {

    final DioClient client;
    
    TodoDataSourceImpl({required this.client});

  @override
  Future<Either<Failure ,List<TodoModel>>> getTodos() async {
    final Result result = await client.get(UrlConstants.todoUrl);
    if(result is SuccessState){
      var jsondata = (result.value as List).map((json)=>TodoModel.fromJson(json )).toList();
      return Right(jsondata);
    }
    else{
      return const Left(Failure('Error'));
    }
  }
}