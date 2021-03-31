import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate({DateTime dateTime}) {
    return DateFormat('EEE, MMM dm y').format(dateTime);
  }

  static getItem({IconData icon, int value, String units}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 28,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          units,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
