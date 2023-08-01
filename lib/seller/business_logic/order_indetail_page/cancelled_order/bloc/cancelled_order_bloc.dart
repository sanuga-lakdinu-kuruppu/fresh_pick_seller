import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cancelled_order_event.dart';
part 'cancelled_order_state.dart';

class CancelledOrderBloc extends Bloc<CancelledOrderEvent, CancelledOrderState> {
  CancelledOrderBloc() : super(CancelledOrderInitial()) {
    on<CancelledOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
