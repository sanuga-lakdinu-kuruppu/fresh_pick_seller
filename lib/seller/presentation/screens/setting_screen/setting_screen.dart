import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/settings_page/bloc/settings_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/login_screen/login_main.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/setting_page_payment_cards/billing_payment_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/setting_page_payment_cards/membership_tile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../widgets/loading_tile/screen_loading_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SettingsPageBloc settingPageBloc;
  @override
  void initState() {
    settingPageBloc = BlocProvider.of<SettingsPageBloc>(context);
    settingPageBloc.add(SettingPageInitialFetchEvent());
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
    return BlocConsumer<SettingsPageBloc, SettingsPageState>(
      bloc: settingPageBloc,
      listenWhen: (previous, current) => current is SettingsPageActionState,
      buildWhen: (previous, current) => current is! SettingsPageActionState,
      listener: (context, state) {
        if (state is SettingsPageFullNameWantToEditActionState) {
          Alert(
              style: alertStyle,
              context: context,
              title: 'Full Name',
              content: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: 'Enter your full name here',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              buttons: [
                DialogButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      settingPageBloc.add(
                          SettingPageFullNamePopUpSaveButtonClickedEvent());
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                DialogButton(
                    color: Colors.white,
                    child: const Text('Cancel',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      settingPageBloc
                          .add(SettingPageAnyCancelButtonClickedEvent());
                    }),
              ]).show();
        } else if (state is SettingsPageNavigateToPreviousPageAtionState) {
          Navigator.of(context).pop();
        } else if (state is SettingsPageFullNameEditedAtionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Full Name is saved successfully')));
        } else if (state is SettingsPageLogoutCheckAtionState) {
          _showConfirmationDialog(context);
        } else if (state is SettingsPageLogoutSuccessAtionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SettingsPageLoadingState:
            return const ScreenLoadingWidget();

          case SettingsPageLoadingSucessState:
            final sucessState = state as SettingsPageLoadingSucessState;
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: double.maxFinite,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                color: Colors.grey,
                              )
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: 105,
                              height: 105,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          sucessState.user.imageUrl),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            SizedBox(
                              height: double.maxFinite,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.greenAccent,
                                              width: 2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 6,
                                            width: 6,
                                            decoration: const BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            'Active',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.greenAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        sucessState.user.fullName,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const Icon(Icons.star, color: Colors.red),
                                    const SizedBox(width: 10),
                                    Text(
                                        sucessState.user.userRatings.toString())
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Your Info',
                              style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        width: 390,
                        height: 360,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                color: Colors.grey,
                              )
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Full Name',
                                        style: TextStyle(color: Colors.grey)),
                                    Text(sucessState.user.fullName.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      settingPageBloc.add(
                                          SettingPageFullNameEditButtonClickedEvent());
                                    },
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Address',
                                        style: TextStyle(color: Colors.grey)),
                                    Text(sucessState.user.address.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('Mobile Number',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.verified_user,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    ),
                                    Text(
                                        '+${sucessState.user.mobileNumber.toString()}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('Email Address',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.verified,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                    Text(
                                        sucessState.user.emailAddress
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Nic Number',
                                        style: TextStyle(color: Colors.grey)),
                                    Text(sucessState.user.nicNumber.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Date of Birth',
                                        style: TextStyle(color: Colors.grey)),
                                    Text(sucessState.user.dob.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 170,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            BillingPaymentTile(),
                            SizedBox(width: 10),
                            MembershipTile(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Your Preferences',
                              style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        width: 390,
                        height: 290,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                color: Colors.grey,
                              )
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Language',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('English',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Verification',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.verified,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                    Text('Not Verified',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Password',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('........',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black))
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit))
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.maxFinite, 67),
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.greenAccent,
                                            width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Romove Account',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.greenAccent,
                                          fontWeight: FontWeight.bold)),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            minimumSize: const Size(double.maxFinite, 67),
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          settingPageBloc
                              .add(SettingPageLogoutButtonClickedEvent());
                        },
                        child: const Center(
                          child: Text('Logout',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
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

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevent dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content:
              const Text('Are you sure you want to Logout from the System?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                settingPageBloc
                    .add(SettingPageLogoutButtonClickedConfirmedEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
