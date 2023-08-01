import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:fresh_pick_seller/seller/data/repository/order_page_repository/order_repository.dart';
import 'package:meta/meta.dart';

part 'requested_order_in_details_event.dart';
part 'requested_order_in_details_state.dart';

class RequestedOrderInDetailsBloc
    extends Bloc<RequestedOrderInDetailsEvent, RequestedOrderInDetailsState> {
  RequestedOrderInDetailsBloc() : super(RequestedOrderInDetailsInitial()) {
    on<RequestedOrderInDetailPageAcceptOrderButtonClickedEvent>(
        requestedOrderInDetailPageAcceptOrderButtonClickedEvent);
    on<RequestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent>(
        requestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent);
  }

  FutureOr<void> requestedOrderInDetailPageAcceptOrderButtonClickedEvent(
      RequestedOrderInDetailPageAcceptOrderButtonClickedEvent event,
      Emitter<RequestedOrderInDetailsState> emit) {
    emit(RequestedOrderInDetailsAcceptedButtonClickedActionState());
  }

  FutureOr<void> requestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent(
      RequestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent event,
      Emitter<RequestedOrderInDetailsState> emit) async {
    bool isUpdated = await OrderRepository()
        .updateOrderStatus('accepted', event.selectedOrder.orderId!);

    if (isUpdated) {
      emit(RequestedOrderInDetailsOrderMovedToAcceptedSucessActionState());
    } else {
      emit(RequestedOrderInDetailsOrderMovedToAcceptedErrorActionState());
    }
  }
}
