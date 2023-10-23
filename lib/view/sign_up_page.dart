import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/viewmodel/sign_up_view_model.dart';
import 'package:book_explorer/widgets/default_dialog.dart';
import 'package:book_explorer/widgets/reusable_elevated_button_widget.dart';
import 'package:book_explorer/widgets/reusable_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../resources/dimen.dart';
import '../resources/strings.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = context.watch<SignUpViewModel>();
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(SIGN_UP_TEXT),
      ),
      body: SingleChildScrollView(
        child: viewModel.loading == true
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                height: height * 0.75,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: REGISTER_LOTTIE_WIDTH,
                        height: REGISTER_LOTTIE_HEIGHT,
                        child: Lottie.asset(REGISTER_LOTTIE_IMG_PATH),
                      ),
                      ReusableTextFormField(
                          controller: viewModel.nameController,
                          hint: USER_NAME_TEXT,
                        isPassword: false,
                      ),

                      SizedBox(
                        height: DEFAULT_PADDING,
                      ),
                      ReusableTextFormField(
                          controller: viewModel.passwordController,
                          hint: PASSWORDD_TEXT,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: DEFAULT_PADDING,
                      ),
                      ReusableTextFormField(
                          controller: viewModel.confirmController,
                          hint: CONFIRM_PASSWORD_TEXT,isPassword: true,),
                      SizedBox(
                        height: DEFAULT_PADDING,
                      ),
                      ReusableElevatedButton(
                          title: SIGN_UP_TEXT,
                          onPressAction: () async {
                            if(viewModel.checkTextField()){
                              if (viewModel.checkPassword() == true) {
                                await viewModel.signUp();
                                if (viewModel.personExist == true) {
                                  defaultShowDialog(
                                      context,
                                    USER_ALR_EXIST_TEXT,
                                      Icons.error_outline,
                                  true,);
                                } else {

                                  defaultShowDialog(context, ACCOUNT_CREATED_TEXT, Icons.person,false);
                                  Future.delayed(Duration(milliseconds: 1000),
                                          () {
                                        viewModel.clearController();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => LoginPage()));
                                      });
                                }
                              } else {
                                defaultShowDialog(context, PASSWORD_NOT_MATCH_TEXT,
                                    Icons.warning,true);
                              }
                            }

                          })
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
