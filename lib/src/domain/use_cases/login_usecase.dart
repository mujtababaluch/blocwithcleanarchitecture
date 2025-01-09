import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/core/usecases/usecase.dart';
import 'package:blocwithcleanarchitecture/src/data/models/login_response_model.dart';
import 'package:blocwithcleanarchitecture/src/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements UseCaseYes<LoginResponseModel> {
  final LoginRepository repo;
  LoginUsecase(this.repo);
  @override
  Future<Either<Failure, LoginResponseModel>> invoke(map) async {
   return await repo.login(map);
  }
}