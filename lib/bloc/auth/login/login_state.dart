import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final String message;
  LoginSuccessState(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
  @override
  List<Object?> get props => [error];
}