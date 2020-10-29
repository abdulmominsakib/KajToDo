import 'package:flutter/material.dart';
import 'package:kajtodo/styling/style.dart';

class TaskStateCard extends StatelessWidget {
  final int cardNumber;
  final String cardDetails;

  TaskStateCard({@required this.cardDetails, @required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF975A1),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$cardNumber',
              style: kBigText.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$cardDetails',
              style: kSubBigText,
            ),
          ],
        ),
      ),
    );
  }
}
