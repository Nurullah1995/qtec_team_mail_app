import 'package:flutter/material.dart';
import 'package:qtec_tem_mail/Model/message_res_model.dart';
import 'package:qtec_tem_mail/bloc/message/message_bloc.dart';
import 'package:qtec_tem_mail/bloc/message/message_event.dart';
import 'package:qtec_tem_mail/bloc/message/message_state.dart';
import 'package:qtec_tem_mail/repositories/message_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/widget/rps_custom_painter.dart';


class MessageScreen extends StatelessWidget {
  final String? email ;
  const MessageScreen({super.key,this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('TEMP MAIL',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue,
          ),
          body: blocBody(),
        )
    );
  }


  Widget blocBody() {
    return BlocProvider(
      create: (context) =>
      MessageBloc(
        MessageRepository(),
      )
        ..add(LoadMessageEvent()),
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is MessageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MessageLoadedState) {
            TextEditingController domainNaimCtlr=TextEditingController();
          //  domainNaimCtlr.text=domain.domain!;
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
                    painter: RPSCustomPainter(email!),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Message",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),)
                ),
               Expanded(
                   child: Container(
                     padding: EdgeInsets.all(20),
                     child: ListView.builder(
                         itemCount: state.messageResponselist.length,
                         itemBuilder: (BuildContext context, int index){
                           return Card(
                             elevation: 2,
                             child: Container(
                               color: Colors.white,
                               padding: EdgeInsets.all(20),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: 10,),
                                   Text("From",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                                   SizedBox(height: 10,),
                                   Text(state.messageResponselist[index].from!.address!),
                                   SizedBox(height: 10,),
                                   Text("to",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                                   SizedBox(height: 10,),
                                   Text(state.messageResponselist[index].to!.first.address!),
                                   SizedBox(height: 10,),
                                   Text("time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                                   SizedBox(height: 10,),
                                    Text(state.messageResponselist[index].createdAt!),
                                   SizedBox(height: 10,),
                                   Text("subject",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                                   SizedBox(height: 10,),
                                   Text(state.messageResponselist[index].subject!),
                                   SizedBox(height: 10,),
                                   Text("Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue),),
                                   SizedBox(height: 10,),
                                  Text(state.messageResponselist[index].intro!),
                                   SizedBox(height: 10,),
                                 ],
                               ),
                             ),
                           );
                         }
                     ),
                   )
               ),

              ],
            );
          }
          if (state is MessageErrorState) {
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
