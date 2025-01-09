import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/core/utils/url_constants.dart';
import 'package:blocwithcleanarchitecture/src/data/api/result.dart';
import 'package:blocwithcleanarchitecture/src/data/models/login_response_model.dart';
import 'package:blocwithcleanarchitecture/src/domain/data_sources/login_data_source.dart';
import 'package:dartz/dartz.dart';

import '../api/dio_client.dart';

class LoginDataSourceImpl  implements LoginDataSource {

  final DioClient client;

  LoginDataSourceImpl({required this.client});
  @override
  Future<Either<Failure, LoginResponseModel>> signin(var map) async {

    final Result result = await client.post(UrlConstants.loginUrl, map);
    if (result is SuccessState){
      var jsondata =  LoginResponseModel.fromJson(result.value);
      return Right(jsondata);
    }
    else{
      return const Left(Failure('Error in apis'));
    }
  }
}