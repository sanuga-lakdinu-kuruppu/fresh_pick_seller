part of 'auth_page_bloc.dart';

@immutable
abstract class AuthPageEvent {}

class AuthPageInitialEvent extends AuthPageEvent {}

class AuthPageNextButtonClickedEvent extends AuthPageEvent {
  final String email;

  AuthPageNextButtonClickedEvent({required this.email});
}

class AuthPageLoginButtonClickedEvent extends AuthPageEvent {
  final String password;

  AuthPageLoginButtonClickedEvent({required this.password});
}

class AuthPageAnyBackButtonClickedEvent extends AuthPageEvent {}

class AuthPageSignUpButtonClickedEvent extends AuthPageEvent {}
