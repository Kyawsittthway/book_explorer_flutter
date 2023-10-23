import 'package:flutter/material.dart';

class ReusableElevatedButton extends StatelessWidget {
  String title;
  Function onPressAction;
  ReusableElevatedButton({
    Key? key,
    required this.title,
    required this.onPressAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(

        onPressed: () {
          onPressAction();
        },
        child: Text(title),
      ),
    );
  }
}