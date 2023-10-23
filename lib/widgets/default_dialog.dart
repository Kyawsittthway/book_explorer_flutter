import 'package:flutter/material.dart';

void defaultShowDialog(BuildContext context,String status,IconData icon,bool warning) {
  showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 120,
          width: 300,
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 40,
                      color: warning ? Colors.red : Colors.black,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: warning ? Colors.red: Colors.black,
                        fontSize: 20,
                      ),
                      child: Text(status),
                    ),
                  ])),
        ),
      ));
}