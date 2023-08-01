import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/dto/new_post_dto/new_post_dto.dart';
import 'package:fresh_pick_seller/seller/data/models/post/post.dart';
import 'package:fresh_pick_seller/seller/data/repository/new_post_repository/new_post_repository.dart';
import 'package:meta/meta.dart';

part 'new_post_page_event.dart';
part 'new_post_page_state.dart';

class NewPostPageBloc extends Bloc<NewPostPageEvent, NewPostPageState> {
  NewPostPageBloc() : super(NewPostPageInitial()) {
    on<NewPostPageInitialFetchEvent>(newPostPageInitialFetchEvent);
    on<NewPostPageCreateNewPostButtonClickedEvent>(
        newPostPageCreateNewPostButtonClickedEvent);
    on<NewPostPageCancelButtonClickedEvent>(
        newPostPageCancelButtonClickedEvent);
  }

  FutureOr<void> newPostPageInitialFetchEvent(
      NewPostPageInitialFetchEvent event, Emitter<NewPostPageState> emit) {
    emit(NewPostPageLoadingSucessState());
  }

  FutureOr<void> newPostPageCreateNewPostButtonClickedEvent(
      NewPostPageCreateNewPostButtonClickedEvent event,
      Emitter<NewPostPageState> emit) async {
    NewPostRepository newPostRepository = NewPostRepository();

    NewPostDTO newPostDTO = event.newPostDTO;

    String url = await newPostRepository
        .uploadPostImageToStorage(event.newPostDTO.imageFile);

    PostDataModel postDataModel = PostDataModel(
        sellerId: '12',
        postName: newPostDTO.postName,
        postCategory: newPostDTO.postCategory,
        postSubCategory: newPostDTO.postSubCategory,
        postDescription: newPostDTO.postDescription,
        pickupLocation: newPostDTO.pickupLocation,
        postedDate: newPostDTO.postedDate,
        imageUrl: url,
        minimumOrderQty: newPostDTO.minimumOrderQty,
        unit: newPostDTO.unit,
        minimumOrderPrice: newPostDTO.minimumOrderPrice,
        postStatus: 'Active',
        countCompletedOrders: 0);

    bool isSaved =
        await newPostRepository.savePostDetails(postDataModel.toJson());
    if (isSaved) {
      emit(NewPostPageDataSavedSucessActionState());
    } else {
      emit(NewPostPageDataSavedErrorActionState());
    }
  }

  FutureOr<void> newPostPageCancelButtonClickedEvent(
      NewPostPageCancelButtonClickedEvent event,
      Emitter<NewPostPageState> emit) {
    emit(NewPostPageLoadingSucessState());
  }
}
