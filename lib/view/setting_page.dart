
import 'package:book_explorer/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title:Text("Setting Page"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(

          children: [
            SettingItemWidget(title: "Log Out",icon: Icon(Icons.logout,size: 30,),onTapAction: (){},),
            SizedBox(height: 20,),
            SettingItemWidget(title: "Delete Account",icon: Icon(Icons.remove_circle,size: 30,),onTapAction: (){},)
          ],
        ),
      ),
    );
  }
}


