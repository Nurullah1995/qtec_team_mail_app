import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DomainEvent extends Equatable {
  const DomainEvent();
}

class LoadDomainEvent extends DomainEvent {
  @override
  List<Object?> get props => [];
}