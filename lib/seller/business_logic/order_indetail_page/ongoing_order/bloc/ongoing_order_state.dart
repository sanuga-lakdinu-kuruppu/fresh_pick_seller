part of 'ongoing_order_bloc.dart';

@immutable
abstract class OngoingOrderState {}

abstract class OngoingOrderActionState extends OngoingOrderState {}

class OngoingOrderInitial extends OngoingOrderState {}

class OngoingOrderStartDeliveryButtonClickedActionState
    extends OngoingOrderActionState {}

class OngoingOrderStartDeliveryButtonClickedConfirmedSucessActionState
    extends OngoingOrderActionState {}

class OngoingOrderStartDeliveryButtonClickedConfirmedErrorActionState
    extends OngoingOrderActionState {}
