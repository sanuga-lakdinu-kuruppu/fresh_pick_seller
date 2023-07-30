part of 'auth_page_bloc.dart';

@immutable
abstract class AuthPageEvent {}

class AuthPageInitialEvent extends AuthPageEvent {}

class AuthPageNextButtonClickedEvent extends AuthPageEvent {}

class AuthPageAnyBackButtonClickedEvent extends AuthPageEvent {}

class AuthPageSignUpButtonClickedEvent extends AuthPageEvent {}
