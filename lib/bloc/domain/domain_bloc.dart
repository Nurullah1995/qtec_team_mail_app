
import 'package:qtec_tem_mail/bloc/domain/domain_event.dart';
import 'package:qtec_tem_mail/bloc/domain/domain_state.dart';
import 'package:qtec_tem_mail/repositories/domain_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final DomainRepository _userRepository;

  DomainBloc(this._userRepository) : super(DomainLoadingState()) {
    on<LoadDomainEvent>((event, emit) async {
      emit(DomainLoadingState());
      try {
        final users = await _userRepository.getDomain();
        emit(DomainLoadedState(users));
      } catch (e) {
        emit(DomainErrorState(e.toString()));
      }
    });
  }
}