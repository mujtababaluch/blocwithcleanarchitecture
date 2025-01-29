import 'package:bloc/bloc.dart';
import 'package:blocwithcleanarchitecture/src/core/errors/failure.dart';
import 'package:blocwithcleanarchitecture/src/data/models/login_response_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injector.dart';
import '../../../../core/network/network_info.dart';
import '../../../../domain/use_cases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

    final network = injector<NetworkInfoI>();
  final connectivityResult = ConnectivityResult.none;
  final getloginsUsecase = injector<LoginUsecase>();
    
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(loginuser);
  }
   void loginuser( LoginButtonPressed event, Emitter<LoginState> emit) async{
    emit(LoginLoading());
     final isConnected = await network.isConnected();
    if (!isConnected) {
      emit(LoginError("Please connect your device to wifi or mobile network"));
      return;
    }
    var map = {
      "username": event.username,
      "password": event.password,
      "expiresInMins": 60
    };
    final result = await getloginsUsecase.invoke(map);
    _handleFetchResult(result, emit);
   }

  Future<void> _handleFetchResult(Either<Failure , LoginResponseModel> result, Emitter<LoginState> emit) async {
    result.fold(
      (failure){
        emit(LoginError(failure.message));
      },
       (todos) => emit(LoginLoaded(todos.username!)),
    );
  }
}
