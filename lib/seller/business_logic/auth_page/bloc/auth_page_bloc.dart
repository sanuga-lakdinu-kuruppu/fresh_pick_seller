import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/repository/auth_repository/authrepository.dart';
import 'package:meta/meta.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  String email = '';
  String password = '';
  AuthPageBloc() : super(AuthPageInitial()) {
    on<AuthPageInitialEvent>(authPageInitialEvent);
    on<AuthPageNextButtonClickedEvent>(authPageNextButtonClickedEvent);
    on<AuthPageAnyBackButtonClickedEvent>(authPageAnyBackButtonClickedEvent);
    on<AuthPageSignUpButtonClickedEvent>(authPageSignUpButtonClickedEvent);
    on<AuthPageLoginButtonClickedEvent>(authPageLoginButtonClickedEvent);
  }

  FutureOr<void> authPageInitialEvent(
      AuthPageInitialEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageLoadingSucessState());
  }

  FutureOr<void> authPageNextButtonClickedEvent(
      AuthPageNextButtonClickedEvent event, Emitter<AuthPageState> emit) {
    email = event.email;
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

  FutureOr<void> authPageLoginButtonClickedEvent(
      AuthPageLoginButtonClickedEvent event, Emitter<AuthPageState> emit) {
    password = event.password;
    var returnValue =
        AuthRepository().signInWithEmailAndPassword(email, password);

    // ignore: unnecessary_null_comparison
    if (returnValue != null) {
      print('logged okay');
      emit(AuthPageLoginSuccessActionState());
    } else {
      print('logged not okay');
      emit(AuthPageLoginErrorActionState());
    }
  }
}
