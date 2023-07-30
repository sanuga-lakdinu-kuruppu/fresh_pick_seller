part of 'notification_page_bloc.dart';

@immutable
abstract class NotificationPageState {}

abstract class NotificationPageActionState extends NotificationPageState {}

class NotificationPageInitial extends NotificationPageState {}

class NotificationPageLoadingState extends NotificationPageState {}

class NotificationPageLoadingSucessState extends NotificationPageState {
  final List<NotificationsDataModel> notificationsDataList;

  NotificationPageLoadingSucessState({required this.notificationsDataList});
}

class NotificationPageLoadingErrorState extends NotificationPageState {}

class NotificationPagePopUpMessageActionState
    extends NotificationPageActionState {
  final NotificationsDataModel notificationsDataModel;

  NotificationPagePopUpMessageActionState(
      {required this.notificationsDataModel});
}

class NotificationPageNavigateToPreviousPageAtionState
    extends NotificationPageActionState {}
