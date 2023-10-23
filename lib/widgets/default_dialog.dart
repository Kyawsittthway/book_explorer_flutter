import 'package:flutter/material.dart';

import '../resources/dimen.dart';

void defaultShowDialog(
    BuildContext context, String status, IconData icon, bool warning) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(NORMAL_BORDER_RADIUS),
              ),
              height: DIALOG_HEIGHT,
              width: DIALOG_WIDTH,
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(
                      icon,
                      size: MEDIUM_ICON_SIZE,
                      color: warning ? Colors.red : Colors.black,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: warning ? Colors.red : Colors.black,
                        fontSize: 20,
                      ),
                      child: Text(status),
                    ),
                  ])),
            ),
          ));
}
