part of 'notification_page_bloc.dart';

@immutable
abstract class NotificationPageEvent {}

class NotificationPageInitialFetchEvent extends NotificationPageEvent {}

class NotificationPageMessageItemClickedEvent extends NotificationPageEvent {
  final NotificationsDataModel notificationsDataModel;

  NotificationPageMessageItemClickedEvent(
      {required this.notificationsDataModel});
}

class NotificationPageCancelButtonClickedEvent extends NotificationPageEvent {}
