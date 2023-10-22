import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  String title;
  Icon icon;
  Function onTapAction;

  SettingItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTapAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20),

        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(

          children: [
            icon,
            SizedBox(
              width: 40,
            ),
            Text(title),
          ],
        ),
      ),
      onTap: (){
        onTapAction();
      },
    );
  }
}