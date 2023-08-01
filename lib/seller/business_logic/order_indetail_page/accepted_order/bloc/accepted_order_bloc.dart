import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:meta/meta.dart';

import '../../../../data/repository/order_page_repository/order_repository.dart';

part 'accepted_order_event.dart';
part 'accepted_order_state.dart';

class AcceptedOrderIndetailPageBloc
    extends Bloc<AcceptedOrderEvent, AcceptedOrderState> {
  AcceptedOrderIndetailPageBloc() : super(AcceptedOrderInitial()) {
    on<AcceptedOrderInDetailPageCancelOrderButtonClickedEvent>(
        acceptedOrderInDetailPageCancelOrderButtonClickedEvent);
    on<AcceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent>(
        acceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent);
  }

  FutureOr<void> acceptedOrderInDetailPageCancelOrderButtonClickedEvent(
      AcceptedOrderInDetailPageCancelOrderButtonClickedEvent event,
      Emitter<AcceptedOrderState> emit) {
    emit(AcceptedOrderCancelledButtonClickedActionState());
  }

  FutureOr<void>
      acceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent(
          AcceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent event,
          Emitter<AcceptedOrderState> emit) async {
    bool isUpdated = await OrderRepository()
        .updateOrderStatus('cancelled', event.selectedOrder.orderId!);

    if (isUpdated) {
      emit(AcceptedOrderCancelledSucessActionState());
    } else {
      emit(AcceptedOrderCancelledErrorActionState());
    }
  }
}
