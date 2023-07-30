part of 'order_page_bloc.dart';

@immutable
abstract class OrderPageState {}

abstract class OrderPageActionState extends OrderPageState {}

class OrderPageInitial extends OrderPageState {}

class OrderPageLoadingState extends OrderPageState {}

class OrderPageLoadingSucessState extends OrderPageState {}

class OrderPageLoadingErrorState extends OrderPageState {}
