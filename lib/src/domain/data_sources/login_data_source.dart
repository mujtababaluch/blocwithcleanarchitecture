import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/data/models/login_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginDataSource {
   Future<Either<Failure,LoginResponseModel>> signin(var map);
}