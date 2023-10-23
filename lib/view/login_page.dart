import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/sign_up_page.dart';
import 'package:book_explorer/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../resources/dimen.dart';
import '../resources/strings.dart';
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
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(PAGE_TITLE),
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
                      width: LOGIN_LOTTIE_HEIGHT,
                      height: LOGIN_LOTTIE_WIDTH,
                      child: Lottie.asset(LOGIN_LOTTIE_IMG_PATH),
                    ),
                    ReusableTextFormField(
                      controller: loginViewModel.nameController,
                      hint: USER_NAME_TEXT,
                      isPassword: false,
                    ),
                    SizedBox(
                      height: DEFAULT_PADDING,
                    ),
                    ReusableTextFormField(
                      controller: loginViewModel.passwordController,
                      hint: PASSWORDD_TEXT,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: DEFAULT_PADDING,
                    ),
                    ReusableElevatedButton(
                        title: SIGN_IN_TEXT,
                        onPressAction: () async {
                          await loginViewModel.login(context);

                          if (loginViewModel.isLoggedIn) {
                            defaultShowDialog(
                                context, LOGGING_IN_TEXT, Icons.login, false);
                            Future.delayed(Duration(milliseconds: 800), () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SearchResultPage()));
                            });
                          } else {
                            defaultShowDialog(
                                context, NO_USER_FOUND_TEXT, Icons.error, true);
                          }
                        }),
                    SizedBox(
                      height: DEFAULT_PADDING,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: Text(
                        SIGN_UP_TEXT,
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
