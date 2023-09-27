part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

abstract class HomePageActionState extends HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadingSucsessState extends HomePageState {
  final List<PostDataModel> posts;

  HomePageLoadingSucsessState({required this.posts});
}
