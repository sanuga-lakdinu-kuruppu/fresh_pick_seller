part of 'order_page_bloc.dart';

@immutable
abstract class OrderPageEvent {}

class OrderPageInitialFetchEvent extends OrderPageEvent {}

class OrderPageRequestedOrderTileClickedEvent extends OrderPageEvent {
  final OrderDataModel selectedOrder;

  OrderPageRequestedOrderTileClickedEvent({required this.selectedOrder});
}

class OrderPageAcceptedOrderTileClickedEvent extends OrderPageEvent {
  final OrderDataModel selectedOrder;

  OrderPageAcceptedOrderTileClickedEvent({required this.selectedOrder});
}

class OrderPageCancelledOrderTileClickedEvent extends OrderPageEvent {
  final OrderDataModel selectedOrder;

  OrderPageCancelledOrderTileClickedEvent({required this.selectedOrder});
}

class OrderPageOngoingOrderTileClickedEvent extends OrderPageEvent {
  final OrderDataModel selectedOrder;

  OrderPageOngoingOrderTileClickedEvent({required this.selectedOrder});
}

class OrderPageCompletedOrderTileClickedEvent extends OrderPageEvent {
  final OrderDataModel selectedOrder;

  OrderPageCompletedOrderTileClickedEvent({required this.selectedOrder});
}
