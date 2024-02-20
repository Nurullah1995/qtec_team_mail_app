import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/bloc/auth/login/login_bloc.dart';
import 'package:qtec_tem_mail/bloc/auth/login/login_event.dart';
import 'package:qtec_tem_mail/bloc/auth/login/login_state.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_bloc.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_event.dart';
import 'package:qtec_tem_mail/bloc/auth/signup/signup_state.dart';
import 'package:qtec_tem_mail/screen/message_Screen.dart';
import 'package:qtec_tem_mail/widget/rps_custom_painter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatelessWidget {
  final String domainName;
  LoginScreen(this.domainName);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();


  final   LoginBloc _loginBloc=LoginBloc(LoginInitialState());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text('TEMP MAIL',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue,
          ),
          body: blocBody(context),
        )
    );
  }
  Widget blocBody(BuildContext context) {
    _domainController.text=domainName;
    return Column(
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
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: TextField(
                    controller: _emailController,
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                )
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: TextField(
                    controller: _domainController,
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
        SizedBox(height: 40,),
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: TextField(
            controller: _passwordController,
            autofocus: false,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'password',
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 40,),
        BlocListener<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (context, state) async {
            // do stuff here based on BlocA's state
            if(state is LoginSuccessState){
              print(state.message);
              String message=state.message;
              final storage = new FlutterSecureStorage();

              await storage.write(key: 'jwt', value: message);
              final snackBar = SnackBar(
                content: Text(message),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              final email=_emailController.text+_domainController.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen(email: email,)),
              );
            }
            else if(state is LoginErrorState){
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
                child: const Text('Login',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                    final snackBar = SnackBar(
                      content: Text('please Enter user name and password'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    String email = _emailController.text+_domainController.text;
                    String password = _passwordController.text;
                    _loginBloc.add(LoginUserEvent(email, password));
                  }
                },
              )
          ),
        ),
        Row(
          children: <Widget>[
            const Text('Does not have account?'),
            TextButton(
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 20,color: Colors.blue),
              ),
              onPressed: () {
                //signup screen
                Navigator.pop(context);
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}