import 'dart:async';

import 'package:qtec_tem_mail/bloc/auth/login/login_event.dart';
import 'package:qtec_tem_mail/bloc/auth/login/login_state.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_event.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/repositories/login_repo.dart';
import 'package:qtec_tem_mail/repositories/signup_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState ): super(initialState){
    on(eventHandler);
  }


  FutureOr<void> eventHandler(LoginEvent event, Emitter<LoginState> emit) async {
    if(event is LoginUserEvent ){

      try{
        await AuthRepository().login(event.email, event.password).then((value) {
          emit(LoginSuccessState(value));
        });
      }
      catch(e){
        emit(LoginErrorState(e.toString()));
      }
    }
  }
}