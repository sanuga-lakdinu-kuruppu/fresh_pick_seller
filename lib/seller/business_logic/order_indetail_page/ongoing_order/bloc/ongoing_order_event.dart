part of 'ongoing_order_bloc.dart';

@immutable
abstract class OngoingOrderEvent {}

class OngoingOrderStartDeliveryButtonClickedEvent extends OngoingOrderEvent {}

class OngoingOrderStartDeliveryButtonClickedConfirmedEvent
    extends OngoingOrderEvent {
  final OrderDataModel selectedOrder;

  OngoingOrderStartDeliveryButtonClickedConfirmedEvent(
      {required this.selectedOrder});
}
