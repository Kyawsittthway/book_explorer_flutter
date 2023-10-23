import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/viewmodel/setting_view_model.dart';
import 'package:book_explorer/widgets/default_dialog.dart';
import 'package:book_explorer/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/dimen.dart';
import '../resources/strings.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingViewModel viewModel = context.watch<SettingViewModel>();
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text(SETTING_TITLE),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: PADDING_20X, horizontal: PADDING_10X),
          child: Column(
            children: [
              SettingItemWidget(
                title: LOG_OUT_TEXT,
                icon: Icon(
                  Icons.logout,
                  size: DEFAULT_ICON_SIZE,
                ),
                onTapAction: () async {
                  await viewModel.logOut();
                  viewModel.setIsLoading(true);
                  Future.delayed(Duration(milliseconds: 1000), () {
                    viewModel.setIsLoading(false);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => LoginPage()));
                  });
                },
              ),
              SizedBox(
                height: DEFAULT_PADDING,
              ),
              SettingItemWidget(
                title: DELETE_ACCOUN_TEXT,
                icon: Icon(
                  Icons.remove_circle,
                  size: DEFAULT_ICON_SIZE,
                ),
                onTapAction: () async {
                  await viewModel.removeUser();
                  defaultShowDialog(
                      context, ACCOUNT_DELETED_TEXT, Icons.delete, true);
                  Future.delayed(Duration(milliseconds: 1000), () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);
                    //    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
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
