import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_bloc.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_event.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_state.dart';
import 'package:qtec_tem_mail/screen/login_screen.dart';
import 'package:qtec_tem_mail/widget/rps_custom_painter.dart';


class SignupPage extends StatelessWidget {
    final String domainName;
    SignupPage(this.domainName);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();

  final   SignupBloc _signupBloc=SignupBloc(SignupInitialState());


  @override
  Widget build(BuildContext context) {
    _domainController.text='@'+domainName;
    return SafeArea(
        child: Scaffold(
         resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('TEMP MAIL',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue,
          ),
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4.12,
                child: CustomPaint(
                  size: Size(MediaQuery
                      .of(context)
                      .size
                      .width, (MediaQuery
                      .of(context)
                      .size
                      .width * 0.5833333333333334).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter('Create Account'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: TextField(
                          controller: _emailController,
                          autofocus: false,
                          style: const TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 6.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: TextField(
                          controller: _domainController,
                          autofocus: false,
                          style: const TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 6.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: TextField(
                  controller: _passwordController,
                  autofocus: false,
                  style: const TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              BlocListener<SignupBloc, SignupState>(
                bloc: _signupBloc,
                listener: (context, state) {
                  // do stuff here based on BlocA's state
                  if(state is SignupSuccessState){
                    print(state.message);
                    String message=state.message;
                    final snackBar = SnackBar(
                      content: Text(message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(_domainController.text)),
                    );
                  }
                  else if(state is SignupErrorState){
                    print(state.error);
                    String message=state.error;
                    final snackBar = SnackBar(
                      content: Text(message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child:Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: MaterialButton(
                      color: Colors.blue,
                      child: const Text('Create',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                          final snackBar =  SnackBar(
                            content: Text('Please Enter user name and password'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }else{
                          String email = _emailController.text+_domainController.text;
                          String password = _passwordController.text;
                          print(email);
                          print(password);
                          _signupBloc.add(CreateUserEvent(email, password));
                        }
                      },
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20,color: Colors.blue),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen(_domainController.text)),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}