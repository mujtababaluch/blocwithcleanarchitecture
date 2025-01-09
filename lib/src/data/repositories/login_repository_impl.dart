import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/data/models/login_response_model.dart';
import 'package:blocwithcleanarchitecture/src/domain/data_sources/login_data_source.dart';
import 'package:blocwithcleanarchitecture/src/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, LoginResponseModel>> login(dynamic map) async {
    final response = await dataSource.signin(map);

    return response.fold(
      (failure) => Left(failure),
      (register)async {
        if(register.accessToken !=null){
          return right(register);
        }
         return const Left(Failure("Add address api failed to call"));
      }
    );
  }
}