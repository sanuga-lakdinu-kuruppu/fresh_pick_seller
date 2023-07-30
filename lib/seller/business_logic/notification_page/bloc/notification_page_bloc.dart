import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/notifications/notifications.dart';
import 'package:fresh_pick_seller/test_data/notifications_list.dart';
import 'package:meta/meta.dart';

part 'notification_page_event.dart';
part 'notification_page_state.dart';

class NotificationPageBloc
    extends Bloc<NotificationPageEvent, NotificationPageState> {
  NotificationPageBloc() : super(NotificationPageInitial()) {
    on<NotificationPageInitialFetchEvent>(notificationPageInitialFetchEvent);
    on<NotificationPageMessageItemClickedEvent>(
        notificationPageMessageItemClickedEvent);
    on<NotificationPageCancelButtonClickedEvent>(
        notificationPageCancelButtonClickedEvent);
  }

  FutureOr<void> notificationPageInitialFetchEvent(
      NotificationPageInitialFetchEvent event,
      Emitter<NotificationPageState> emit) async {
    emit(NotificationPageLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(NotificationPageLoadingSucessState(
      notificationsDataList: NotificationList.notificationsList
          .map(
            (e) => NotificationsDataModel(
                id: e['id'],
                title: e['title'],
                timeDate: e['timeDate'],
                message: e['message']),
          )
          .toList(),
    ));
  }

  FutureOr<void> notificationPageMessageItemClickedEvent(
      NotificationPageMessageItemClickedEvent event,
      Emitter<NotificationPageState> emit) {
    emit(NotificationPagePopUpMessageActionState(
        notificationsDataModel: event.notificationsDataModel));
  }

  FutureOr<void> notificationPageCancelButtonClickedEvent(
      NotificationPageCancelButtonClickedEvent event,
      Emitter<NotificationPageState> emit) {
    emit(NotificationPageNavigateToPreviousPageAtionState());
  }
}
