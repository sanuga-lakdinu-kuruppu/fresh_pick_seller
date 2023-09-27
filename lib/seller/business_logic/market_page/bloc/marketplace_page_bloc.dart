import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/post/post.dart';
import 'package:fresh_pick_seller/seller/data/repository/market_place_post_repository/marketplace_post_repository.dart';
import 'package:fresh_pick_seller/test_data/post_list.dart';
import 'package:meta/meta.dart';

part 'marketplace_page_event.dart';
part 'marketplace_page_state.dart';

class MarketplacePageBloc
    extends Bloc<MarketplacePageEvent, MarketplacePageState> {
  MarketplacePageBloc() : super(MarketplacePageInitial()) {
    on<InitialFetchEvent>(initialFetchEvent);
    on<NewPostButtonClickedEvent>(newPostButtonClickedEvent);
    on<PostTileClickedEvent>(postTileClickedEvent);
  }

  FutureOr<void> initialFetchEvent(
      InitialFetchEvent event, Emitter<MarketplacePageState> emit) async {
    emit(MarketplaceLoadingState());
    PostRepository postRepository = PostRepository();
    var list = await postRepository.getAllPostItems('12');
    emit(MarketplaceLoadingSucessState(posts: list));
  }

  FutureOr<void> newPostButtonClickedEvent(
      NewPostButtonClickedEvent event, Emitter<MarketplacePageState> emit) {
    // await Future.delayed(const Duration(seconds: 3));
    emit(MarketplaceNavigateToNewPostPageActionState());
  }

  FutureOr<void> postTileClickedEvent(
      PostTileClickedEvent event, Emitter<MarketplacePageState> emit) {
    emit(MarketplaceNavigateToPostDetailPageActionState(
        selectedPost: event.selectedPost));
  }
}
