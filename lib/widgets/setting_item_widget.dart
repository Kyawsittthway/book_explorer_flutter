import 'package:book_explorer/resources/dimen.dart';
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

        padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),

        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(NORMAL_BORDER_RADIUS),
        ),
        height: SETTING_ITEM_HEIGHT,
        width: MediaQuery.of(context).size.width,
        child: Row(

          children: [
            icon,
            SizedBox(
              width: PADDING_40X,
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