import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/notification_page/bloc/notification_page_bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/notifications/notifications.dart';

// ignore: must_be_immutable
class NotificationTile extends StatelessWidget {
  final NotificationsDataModel notificationsDataModel;
  late NotificationPageBloc notificationPageBloc;
  NotificationTile({super.key, required this.notificationsDataModel});

  @override
  Widget build(BuildContext context) {
    notificationPageBloc = BlocProvider.of<NotificationPageBloc>(context);
    return Align(
      child: GestureDetector(
        onTap: () {
          notificationPageBloc.add(NotificationPageMessageItemClickedEvent(
              notificationsDataModel: notificationsDataModel));
        },
        child: Container(
          alignment: Alignment.center,
          height: 136,
          width: 390,
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    blurRadius: 2,
                    color: Colors.grey)
              ]),
          child: Column(
            children: [
              Container(
                height: 47,
                decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notificationsDataModel.title.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        notificationsDataModel.timeDate.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: Text(
                        notificationsDataModel.message.toString(),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Icon(
                      Icons.message,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
