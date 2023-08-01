part of 'accepted_order_bloc.dart';

@immutable
abstract class AcceptedOrderEvent {}

class AcceptedOrderInDetailPageCancelOrderButtonClickedEvent
    extends AcceptedOrderEvent {}

class AcceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent
    extends AcceptedOrderEvent {
  final OrderDataModel selectedOrder;

  AcceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent(
      {required this.selectedOrder});
}
