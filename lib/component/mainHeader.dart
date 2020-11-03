import 'package:flutter/material.dart';
import 'package:kajtodo/component/tasksList.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:kajtodo/styling/style.dart';
import 'package:provider/provider.dart';

import 'taskStateCard.dart';

String userName = 'Momin';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(top: 50, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, $userName',
                      style: kBigText,
                    ),
                    Hero(
                      tag: 'Avatar',
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/mypic.jpg'),
                        radius: 30,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Let\'s be productive today',
                  style: kSubBigText,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      TaskStateCard(
                        cardDetails: 'Total Task',
                        cardNumber:
                            Provider.of<TaskData>(context).tasksList.length,
                      ),
                      SizedBox(width: 15),
                      TaskStateCard(
                        cardDetails: 'Completed',
                        cardNumber:
                            Provider.of<TaskData>(context).completedTask.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        TasksList(),
      ],
    );
  }
}
