part of 'order_page_bloc.dart';

@immutable
abstract class OrderPageState {}

abstract class OrderPageActionState extends OrderPageState {}

class OrderPageInitial extends OrderPageState {}

class OrderPageLoadingState extends OrderPageState {}

class OrderPageLoadingSucessState extends OrderPageState {
  final List<OrderDataModel>? requestedOrderList;
  final List<OrderDataModel>? acceptedOrderList;
  final List<OrderDataModel>? cancelledOrderList;
  final List<OrderDataModel>? ongoingOrderList;
  final List<OrderDataModel>? completedOrderList;

  OrderPageLoadingSucessState(
      {required this.completedOrderList,
      required this.ongoingOrderList,
      required this.cancelledOrderList,
      required this.acceptedOrderList,
      required this.requestedOrderList});
}

class OrderPageLoadingErrorState extends OrderPageState {}

class OrderPageNavigateToRequestedOrderIndetailPageActionState
    extends OrderPageActionState {
  final OrderDataModel selectedOrder;

  OrderPageNavigateToRequestedOrderIndetailPageActionState(
      {required this.selectedOrder});
}

class OrderPageNavigateToAcceptedOrderIndetailPageActionState
    extends OrderPageActionState {
  final OrderDataModel selectedOrder;

  OrderPageNavigateToAcceptedOrderIndetailPageActionState(
      {required this.selectedOrder});
}

class OrderPageNavigateToCancelledOrderIndetailPageActionState
    extends OrderPageActionState {
  final OrderDataModel selectedOrder;

  OrderPageNavigateToCancelledOrderIndetailPageActionState(
      {required this.selectedOrder});
}

class OrderPageNavigateToOngoingOrderIndetailPageActionState
    extends OrderPageActionState {
  final OrderDataModel selectedOrder;

  OrderPageNavigateToOngoingOrderIndetailPageActionState(
      {required this.selectedOrder});
}

class OrderPageNavigateToCompletedOrderIndetailPageActionState
    extends OrderPageActionState {
  final OrderDataModel selectedOrder;

  OrderPageNavigateToCompletedOrderIndetailPageActionState(
      {required this.selectedOrder});
}
