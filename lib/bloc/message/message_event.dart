
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';


@immutable
abstract class MessageEvent extends Equatable{
 const MessageEvent();
}

class LoadMessageEvent extends MessageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}