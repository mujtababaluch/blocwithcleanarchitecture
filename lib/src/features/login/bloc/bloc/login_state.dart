part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

 class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final String message;

  LoginLoaded(this.message);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
