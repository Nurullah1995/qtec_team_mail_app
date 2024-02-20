import 'package:equatable/equatable.dart';

class SignupEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CreateUserEvent extends SignupEvent{
  final String email;
  final String password;
  CreateUserEvent(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}