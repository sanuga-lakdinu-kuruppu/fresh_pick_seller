part of 'marketplace_page_bloc.dart';

@immutable
abstract class MarketplacePageState {}

abstract class MarketplacePageActionState extends MarketplacePageState {}

class MarketplacePageInitial extends MarketplacePageState {}

class MarketplaceLoadingState extends MarketplacePageState {}

class MarketplaceLoadingSucessState extends MarketplacePageState {
  final List<PostDataModel> posts;

  MarketplaceLoadingSucessState({required this.posts});
}

class MarketplaceLoadingErrorState extends MarketplacePageState {}

class MarketplaceNavigateToNewPostPageActionState
    extends MarketplacePageActionState {}

class MarketplaceNavigateToPostDetailPageActionState
    extends MarketplacePageActionState {
  final PostDataModel selectedPost;

  MarketplaceNavigateToPostDetailPageActionState({required this.selectedPost});
}
