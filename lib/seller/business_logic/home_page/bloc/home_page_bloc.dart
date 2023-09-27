import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/post/post.dart';
import '../../../data/repository/market_place_post_repository/marketplace_post_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageInitialFetchEvent>(homePageInitialFetchEvent);
  }

  FutureOr<void> homePageInitialFetchEvent(
      HomePageInitialFetchEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState());
    PostRepository postRepository = PostRepository();
    var list = await postRepository.getAllPostItems('12');
    emit(HomePageLoadingSucsessState(posts: list));
  }
}
