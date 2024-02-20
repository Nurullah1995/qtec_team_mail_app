import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoginUserEvent extends LoginEvent{
  final String email;
  final String password;
  LoginUserEvent(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}