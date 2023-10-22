import 'package:flutter/material.dart';

void defaultShowDialog(BuildContext context,String status,IconData icon) {
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
                      color: Colors.red,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                      child: Text(status),
                    ),
                  ])),
        ),
      ));
}