import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/membership_screen/membership_screen.dart';

class MembershipTile extends StatelessWidget {
  const MembershipTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        width: 350,
        height: 160,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                offset: Offset(0, 4),
                blurRadius: 2,
                color: Colors.grey,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromRGBO(255, 230, 129, 1),
                ],
                stops: [
                  0.1,
                  1.0
                ])),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Membership',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      'Account will expire on ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '18 July 2023 ',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    minimumSize: const Size(80, 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MembershipScreen()));
                  },
                  child: const Text('More'),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/invitation.png'))),
            ),
          ],
        ),
      ),
    );
  }
}
