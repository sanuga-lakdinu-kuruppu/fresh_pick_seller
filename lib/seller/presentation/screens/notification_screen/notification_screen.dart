import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/notification_page/bloc/notification_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/notification_tile/notification_tile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../widgets/loading_tile/screen_loading_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationPageBloc notificationPageBloc;

  @override
  void initState() {
    notificationPageBloc = BlocProvider.of<NotificationPageBloc>(context);
    notificationPageBloc.add(NotificationPageInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var alertStyle = const AlertStyle(
      animationType: AnimationType.fromBottom,
      animationDuration: Duration(milliseconds: 600),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
    return BlocConsumer<NotificationPageBloc, NotificationPageState>(
      bloc: notificationPageBloc,
      listenWhen: (previous, current) => current is NotificationPageActionState,
      buildWhen: (previous, current) => current is! NotificationPageActionState,
      listener: (context, state) {
        if (state is NotificationPagePopUpMessageActionState) {
          Alert(
              style: alertStyle,
              context: context,
              title: 'Message',
              buttons: [
                DialogButton(
                    color: Colors.greenAccent,
                    child: const Text('Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      notificationPageBloc
                          .add(NotificationPageCancelButtonClickedEvent());
                    }),
              ],
              content: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state.notificationsDataModel.message.toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ))).show();
        } else if (state is NotificationPageNavigateToPreviousPageAtionState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case NotificationPageLoadingState:
            return const ScreenLoadingWidget();
          case NotificationPageLoadingSucessState:
            final sucessState = state as NotificationPageLoadingSucessState;
            return Scaffold(
              body: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.mail, color: Colors.grey),
                                const SizedBox(width: 10),
                                Text(
                                  'Inbox (${sucessState.notificationsDataList.length})',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(151, 151, 151, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const Icon(Icons.list, color: Colors.grey)
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: sucessState.notificationsDataList.length,
                            itemBuilder: (context, index) {
                              return NotificationTile(
                                notificationsDataModel:
                                    sucessState.notificationsDataList[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
