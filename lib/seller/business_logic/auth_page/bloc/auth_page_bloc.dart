import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc() : super(AuthPageInitial()) {
    on<AuthPageInitialEvent>(authPageInitialEvent);
    on<AuthPageNextButtonClickedEvent>(authPageNextButtonClickedEvent);
    on<AuthPageAnyBackButtonClickedEvent>(authPageAnyBackButtonClickedEvent);
    on<AuthPageSignUpButtonClickedEvent>(authPageSignUpButtonClickedEvent);
  }

  FutureOr<void> authPageInitialEvent(
      AuthPageInitialEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageLoadingSucessState());
  }

  FutureOr<void> authPageNextButtonClickedEvent(
      AuthPageNextButtonClickedEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageNavigateToLoginPageActionState());
  }

  FutureOr<void> authPageAnyBackButtonClickedEvent(
      AuthPageAnyBackButtonClickedEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageNavigateToPreviousPageActionState());
  }

  FutureOr<void> authPageSignUpButtonClickedEvent(
      AuthPageSignUpButtonClickedEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageNavigateToSignUpPageActionState());
  }
}
