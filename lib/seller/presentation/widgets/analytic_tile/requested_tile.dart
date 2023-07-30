import 'package:flutter/material.dart';

class RequestedTile extends StatelessWidget {
  const RequestedTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        height: 134,
        width: 191,
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(228, 140, 51, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/orders.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Requested',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '24',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    minimumSize: const Size(80, 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('More'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
