
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qtec_tem_mail/Model/domain_model.dart';
import 'package:qtec_tem_mail/bloc/domain/domain_bloc.dart';
import 'package:qtec_tem_mail/bloc/domain/domain_event.dart';
import 'package:qtec_tem_mail/bloc/domain/domain_state.dart';
import 'package:qtec_tem_mail/repositories/domain_repo.dart';
import 'package:qtec_tem_mail/screen/signup_screen.dart';
import 'package:qtec_tem_mail/widget/rps_custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DomainBloc>(
          create: (BuildContext context) => DomainBloc(DomainRepository()),
        ),
      ],
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('TEMP MAIL',style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.blue,
            ),
            body: blocBody(),
          )
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) =>
      DomainBloc(
        DomainRepository(),
      )
        ..add(LoadDomainEvent()),
      child: BlocBuilder<DomainBloc, DomainState>(
        builder: (context, state) {
          if (state is DomainLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DomainLoadedState) {
           DomainModel domain = state.domain;
           TextEditingController domainNaimCtlr=TextEditingController();
           domainNaimCtlr.text=domain.domain!;
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
                    painter: RPSCustomPainter('Available Domain'),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage(domainNaimCtlr.text)),
                    );
                  },
                  child: Container(
                    height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Tap to create account or login ',
                        style: TextStyle(color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),)
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 30, right: 30),
                  child: TextField(
                    controller: domainNaimCtlr,
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
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
              ],
            );
          }
          if (state is DomainErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }

          return Container();
        },
      ),
    );
  }
}
