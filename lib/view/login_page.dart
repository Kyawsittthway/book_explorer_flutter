import 'package:book_explorer/view/search_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/reusable_elevated_button_widget.dart';
import '../widgets/reusable_textformfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
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
                  controller: nameController,
                  hint: "User Name",
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableTextFormField(
                  controller: passwordController,
                  hint: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                ReusableElevatedButton(title: "Sign In",onPressAction: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SearchPage()));
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
    );
  }
}




