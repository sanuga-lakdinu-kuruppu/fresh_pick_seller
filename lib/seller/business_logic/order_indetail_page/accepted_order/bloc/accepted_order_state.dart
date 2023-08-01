part of 'accepted_order_bloc.dart';

@immutable
abstract class AcceptedOrderState {}

abstract class AcceptedOrderActionState extends AcceptedOrderState {}

class AcceptedOrderInitial extends AcceptedOrderState {}

class AcceptedOrderCancelledButtonClickedActionState
    extends AcceptedOrderActionState {}

class AcceptedOrderCancelledSucessActionState
    extends AcceptedOrderActionState {}

class AcceptedOrderCancelledErrorActionState extends AcceptedOrderActionState {}
