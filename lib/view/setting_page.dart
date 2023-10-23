import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/viewmodel/setting_view_model.dart';
import 'package:book_explorer/widgets/default_dialog.dart';
import 'package:book_explorer/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingViewModel viewModel = context.watch<SettingViewModel>();
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Setting Page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              SettingItemWidget(
                title: "Log Out",
                icon: Icon(
                  Icons.logout,
                  size: 30,
                ),
                onTapAction: () async {
                  await viewModel.logOut();
                  viewModel.setIsLoading(true);
                  Future.delayed(Duration(milliseconds: 1000), () {
                    viewModel.setIsLoading(false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              SettingItemWidget(
                title: "Delete Account",
                icon: Icon(
                  Icons.remove_circle,
                  size: 30,
                ),
                onTapAction: ()async {
                 await viewModel.removeUser();
                 defaultShowDialog(context, "Account Deleted!", Icons.delete);
                 Future.delayed(Duration(milliseconds: 1000),(){

                   Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                 });

                },
              )
            ],
          ),
        ),
      ),
      Visibility(
        visible: viewModel.isLoading,
        child: Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      )
    ]);
  }
}
