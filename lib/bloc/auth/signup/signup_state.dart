import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {}

class SignupInitialState extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignupLoadingState extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState(this.message);
  @override
  List<Object?> get props => [message];
}

class SignupErrorState extends SignupState {
  final String error;

  SignupErrorState(this.error);
  @override
  List<Object?> get props => [error];
}