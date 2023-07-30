import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_page_event.dart';
part 'order_page_state.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState> {
  OrderPageBloc() : super(OrderPageInitial()) {
    on<OrderPageInitialFetchEvent>(oderPageInitialFetchEvent);
  }

  FutureOr<void> oderPageInitialFetchEvent(
      OrderPageInitialFetchEvent event, Emitter<OrderPageState> emit) async {
    emit(OrderPageLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(OrderPageLoadingSucessState());
  }
}
