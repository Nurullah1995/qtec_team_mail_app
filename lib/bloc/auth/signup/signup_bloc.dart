
import 'dart:async';

import 'package:qtec_tem_mail/bloc/auth/signup/signup_event.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/repositories/signup_repo.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(SignupState initialState ): super(initialState){
     on(eventHandler);
  }


  FutureOr<void> eventHandler(SignupEvent event, Emitter<SignupState> emit) async {
      if(event is CreateUserEvent ){

       try{
         await SignUpRepository().signupTempMail(event.email, event.password).then((value) {
           emit(SignupSuccessState(value));
         });
       }
       catch(e){
         emit(SignupErrorState(e.toString()));
       }
      }
  }
}
