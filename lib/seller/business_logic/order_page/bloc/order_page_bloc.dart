import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:fresh_pick_seller/seller/data/repository/order_page_repository/order_repository.dart';
import 'package:meta/meta.dart';
part 'order_page_event.dart';
part 'order_page_state.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState> {
  OrderPageBloc() : super(OrderPageInitial()) {
    on<OrderPageInitialFetchEvent>(oderPageInitialFetchEvent);
    on<OrderPageRequestedOrderTileClickedEvent>(
        orderPageRequestedOrderTileClickedEvent);
    on<OrderPageAcceptedOrderTileClickedEvent>(
        orderPageAcceptedOrderTileClickedEvent);
    on<OrderPageCancelledOrderTileClickedEvent>(
        orderPageCancelledOrderTileClickedEvent);
    on<OrderPageOngoingOrderTileClickedEvent>(
        orderPageOngoingOrderTileClickedEvent);
    on<OrderPageCompletedOrderTileClickedEvent>(
        orderPageCompletedOrderTileClickedEvent);
  }

  FutureOr<void> oderPageInitialFetchEvent(
      OrderPageInitialFetchEvent event, Emitter<OrderPageState> emit) async {
    emit(OrderPageLoadingState());

    OrderRepository orderRepository = OrderRepository();

    //Get requested Orders
    var listRequested = await orderRepository.getAllOders('12', 'requested');

    //Get accepted Orders
    var listAccepted = await orderRepository.getAllOders('12', 'accepted');

    //Get cancelled Orders
    var listCancelled = await orderRepository.getAllOders('12', 'cancelled');

    //Get ongoing Orders
    var listOngoing = await orderRepository.getAllOders('12', 'ongoing');

    //Get completed Orders
    var listCompleted = await orderRepository.getAllOders('12', 'completed');
    emit(OrderPageLoadingSucessState(
        requestedOrderList: listRequested,
        acceptedOrderList: listAccepted,
        cancelledOrderList: listCancelled,
        ongoingOrderList: listOngoing,
        completedOrderList: listCompleted));
  }

  FutureOr<void> orderPageRequestedOrderTileClickedEvent(
      OrderPageRequestedOrderTileClickedEvent event,
      Emitter<OrderPageState> emit) {
    emit(OrderPageNavigateToRequestedOrderIndetailPageActionState(
        selectedOrder: event.selectedOrder));
  }

  FutureOr<void> orderPageAcceptedOrderTileClickedEvent(
      OrderPageAcceptedOrderTileClickedEvent event,
      Emitter<OrderPageState> emit) {
    emit(OrderPageNavigateToAcceptedOrderIndetailPageActionState(
        selectedOrder: event.selectedOrder));
  }

  FutureOr<void> orderPageCancelledOrderTileClickedEvent(
      OrderPageCancelledOrderTileClickedEvent event,
      Emitter<OrderPageState> emit) {
    emit(OrderPageNavigateToCancelledOrderIndetailPageActionState(
        selectedOrder: event.selectedOrder));
  }

  FutureOr<void> orderPageOngoingOrderTileClickedEvent(
      OrderPageOngoingOrderTileClickedEvent event,
      Emitter<OrderPageState> emit) {
    emit(OrderPageNavigateToOngoingOrderIndetailPageActionState(
        selectedOrder: event.selectedOrder));
  }

  FutureOr<void> orderPageCompletedOrderTileClickedEvent(
      OrderPageCompletedOrderTileClickedEvent event,
      Emitter<OrderPageState> emit) {
    emit(OrderPageNavigateToCompletedOrderIndetailPageActionState(
        selectedOrder: event.selectedOrder));
  }
}
