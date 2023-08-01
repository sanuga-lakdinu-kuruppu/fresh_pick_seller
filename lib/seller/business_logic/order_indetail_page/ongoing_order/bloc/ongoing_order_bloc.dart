import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:meta/meta.dart';

import '../../../../data/repository/order_page_repository/order_repository.dart';

part 'ongoing_order_event.dart';
part 'ongoing_order_state.dart';

class OngoingOrderInDetailBloc
    extends Bloc<OngoingOrderEvent, OngoingOrderState> {
  OngoingOrderInDetailBloc() : super(OngoingOrderInitial()) {
    on<OngoingOrderStartDeliveryButtonClickedEvent>(
        ongoingOrderStartDeliveryButtonClickedEvent);
    on<OngoingOrderStartDeliveryButtonClickedConfirmedEvent>(
        ongoingOrderStartDeliveryButtonClickedConfirmedEvent);
  }

  FutureOr<void> ongoingOrderStartDeliveryButtonClickedEvent(
      OngoingOrderStartDeliveryButtonClickedEvent event,
      Emitter<OngoingOrderState> emit) {
    emit(OngoingOrderStartDeliveryButtonClickedActionState());
  }

  FutureOr<void> ongoingOrderStartDeliveryButtonClickedConfirmedEvent(
      OngoingOrderStartDeliveryButtonClickedConfirmedEvent event,
      Emitter<OngoingOrderState> emit) async {
    bool isUpdated = await OrderRepository()
        .updateDeliveryStatus('ongoing', event.selectedOrder.orderId!);

    if (isUpdated) {
      emit(OngoingOrderStartDeliveryButtonClickedConfirmedSucessActionState());
    } else {
      emit(OngoingOrderStartDeliveryButtonClickedConfirmedErrorActionState());
    }
  }
}
