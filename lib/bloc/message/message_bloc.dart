
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_tem_mail/Model/message_res_model.dart';
import 'package:qtec_tem_mail/bloc/domain/domain_state.dart';
import 'package:qtec_tem_mail/bloc/message/message_event.dart';
import 'package:qtec_tem_mail/bloc/message/message_state.dart';
import 'package:qtec_tem_mail/repositories/message_repo.dart';

class MessageBloc extends Bloc<MessageEvent ,MessageState>{
  final MessageRepository _messageRepository;

  MessageBloc(this._messageRepository): super(MessageLoadingState()){
      on((LoadMessageEvent, emit)async {
          emit(MessageLoadingState());
          try{

             final result = await _messageRepository.getMessage();
            emit(MessageLoadedState(result));
          }catch(e){
            emit(MessageErrorState(e.toString()));
          }
      });
  }
}