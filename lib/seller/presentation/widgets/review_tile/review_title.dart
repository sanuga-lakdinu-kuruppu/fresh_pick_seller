import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('@shehara12_0', style: TextStyle(fontSize: 12)),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star, color: Colors.red, size: 16),
                    ],
                  ),
                  Text('4/5', style: TextStyle(fontSize: 12)),
                ],
              ),
              Text('2 minutes ago', style: TextStyle(fontSize: 12))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 240,
                child: Text(
                  'Thank you so much. This is very helpful for me. The Best ever. Very long time I was trying tihs thing. This time, It worked for me. Thank you very much.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
