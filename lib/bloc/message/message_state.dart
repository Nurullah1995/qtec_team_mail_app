import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:qtec_tem_mail/Model/message_res_model.dart';

@immutable
abstract class MessageState extends Equatable {
 const MessageState();
}

class MessageLoadingState extends MessageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MessageLoadedState extends MessageState{
  List<MessageResponse> messageResponselist;
  MessageLoadedState(this.messageResponselist);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MessageErrorState extends MessageState{
  final String error;
  MessageErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
