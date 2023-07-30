part of 'marketplace_page_bloc.dart';

@immutable
abstract class MarketplacePageEvent {}

class InitialFetchEvent extends MarketplacePageEvent {}

class NewPostButtonClickedEvent extends MarketplacePageEvent {}

class FinishedButtonClickedEvent extends MarketplacePageEvent {}

class ActiveButtonClickedEvent extends MarketplacePageEvent {}

class PostTileClickedEvent extends MarketplacePageEvent {
  final PostDataModel selectedPost;

  PostTileClickedEvent({required this.selectedPost});
}
