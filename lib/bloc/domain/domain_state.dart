
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qtec_tem_mail/Model/domain_model.dart';

@immutable
abstract class DomainState extends Equatable {}

class DomainLoadingState extends DomainState {
  @override
  List<Object?> get props => [];
}

class DomainLoadedState extends DomainState {
  final DomainModel domain;
  DomainLoadedState(this.domain);
  @override
  List<Object?> get props => [domain];
}

class DomainErrorState extends DomainState {
  final String error;
  DomainErrorState(this.error);
  @override
  List<Object?> get props => [error];
}