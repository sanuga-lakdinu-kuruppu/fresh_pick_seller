part of 'auth_page_bloc.dart';

@immutable
abstract class AuthPageState {}

abstract class AuthPageActionState extends AuthPageState {}

class AuthPageInitial extends AuthPageState {}

class AuthPageLoadingSucessState extends AuthPageState {}

class AuthPageLoadingErrorState extends AuthPageState {}

class AuthPageNavigateToLoginPageActionState extends AuthPageActionState {}

class AuthPageNavigateToPreviousPageActionState extends AuthPageActionState {}

class AuthPageNavigateToSignUpPageActionState extends AuthPageActionState {}
