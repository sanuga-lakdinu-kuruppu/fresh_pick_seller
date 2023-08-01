part of 'requested_order_in_details_bloc.dart';

@immutable
abstract class RequestedOrderInDetailsState {}

abstract class RequestedOrderInDetailsActionState
    extends RequestedOrderInDetailsState {}

class RequestedOrderInDetailsInitial extends RequestedOrderInDetailsState {}

class RequestedOrderInDetailsAcceptedButtonClickedActionState
    extends RequestedOrderInDetailsActionState {}

class RequestedOrderInDetailsOrderMovedToAcceptedSucessActionState
    extends RequestedOrderInDetailsActionState {}

class RequestedOrderInDetailsOrderMovedToAcceptedErrorActionState
    extends RequestedOrderInDetailsActionState {}
