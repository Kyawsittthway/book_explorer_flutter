import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/sign_up_page.dart';
import 'package:book_explorer/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../widgets/reusable_elevated_button_widget.dart';
import '../widgets/reusable_textformfield_widget.dart';
import '../widgets/default_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = context.watch<LoginViewModel>();

    return Stack(children: [
      WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Book Explorer"),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: Lottie.asset("assets/images/login.json"),
                    ),
                    ReusableTextFormField(
                      controller: loginViewModel.nameController,
                      hint: "User Name",
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableTextFormField(
                      controller: loginViewModel.passwordController,
                      hint: "Password",
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableElevatedButton(
                        title: "Sign In",
                        onPressAction: () async {
                          await loginViewModel.login(context);

                          if (loginViewModel.isLoggedIn) {
                            defaultShowDialog(context, "Logging in", Icons.login,false);
                            Future.delayed(Duration(milliseconds: 800), () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SearchResultPage()));
                            });

                          } else {
                            defaultShowDialog(
                                context, "No User Found!", Icons.error,true);
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
          visible: loginViewModel.loading,
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          )))
    ]);
  }
}
