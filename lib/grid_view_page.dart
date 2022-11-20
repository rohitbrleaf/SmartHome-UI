import 'dart:math';
import 'package:flutter/material.dart';

class GridWidgetsList extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final onChanged;

  GridWidgetsList({
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 65.0,
              color: powerOn ? Colors.white : Colors.black,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      smartDeviceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerOn ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: Switch(
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
