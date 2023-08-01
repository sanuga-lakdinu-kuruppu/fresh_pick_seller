part of 'new_post_page_bloc.dart';

@immutable
abstract class NewPostPageState {}

abstract class NewPostPageActionState extends NewPostPageState {}

class NewPostPageInitial extends NewPostPageState {}

class NewPostPageLoadingState extends NewPostPageState {}

class NewPostPageLoadingSucessState extends NewPostPageState {}

class NewPostPageLoadingErrorState extends NewPostPageState {}

class NewPostPageDataSavedSucessActionState extends NewPostPageActionState {}

class NewPostPageDataSavedErrorActionState extends NewPostPageActionState {}
