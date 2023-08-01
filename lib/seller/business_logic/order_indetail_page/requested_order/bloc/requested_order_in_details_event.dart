part of 'requested_order_in_details_bloc.dart';

@immutable
abstract class RequestedOrderInDetailsEvent {}

class RequestedOrderInDetailPageAcceptOrderButtonClickedEvent
    extends RequestedOrderInDetailsEvent {}

class RequestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent
    extends RequestedOrderInDetailsEvent {
  final OrderDataModel selectedOrder;

  RequestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent(
      {required this.selectedOrder});
}
