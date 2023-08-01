part of 'new_post_page_bloc.dart';

@immutable
abstract class NewPostPageEvent {}

class NewPostPageInitialFetchEvent extends NewPostPageEvent {}

class NewPostPageCreateNewPostButtonClickedEvent extends NewPostPageEvent {
  final NewPostDTO newPostDTO;

  NewPostPageCreateNewPostButtonClickedEvent({required this.newPostDTO});
}

class NewPostPageCancelButtonClickedEvent extends NewPostPageEvent {}
