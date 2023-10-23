import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/viewmodel/sign_up_view_model.dart';
import 'package:book_explorer/widgets/default_dialog.dart';
import 'package:book_explorer/widgets/reusable_elevated_button_widget.dart';
import 'package:book_explorer/widgets/reusable_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = context.watch<SignUpViewModel>();
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
                        width: 300,
                        height: 300,
                        child: Lottie.asset("assets/images/register.json"),
                      ),
                      ReusableTextFormField(
                          controller: viewModel.nameController,
                          hint: "User Name"),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableTextFormField(
                          controller: viewModel.passwordController,
                          hint: "Password"),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableTextFormField(
                          controller: viewModel.confirmController,
                          hint: "Confirm Password"),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableElevatedButton(
                          title: "Sign Up",
                          onPressAction: () async {
                            if(viewModel.checkTextField()){
                              if (viewModel.checkPassword() == true) {
                                await viewModel.signUp();
                                if (viewModel.personExist == true) {
                                  defaultShowDialog(
                                      context,
                                      "User already existed",
                                      Icons.error_outline,
                                  true,);
                                } else {

                                  defaultShowDialog(context, "Account Created!", Icons.person,false);
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
                                defaultShowDialog(context, "Passwords not match",
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
