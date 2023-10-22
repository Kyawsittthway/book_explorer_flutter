import 'package:book_explorer/widgets/reusable_elevated_button_widget.dart';
import 'package:book_explorer/widgets/reusable_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
               ReusableTextFormField(controller: userNameController, hint: "User Name"),
                SizedBox(height: 20,),
                ReusableTextFormField(controller: passwordController, hint: "Password"),
                SizedBox(height: 20,),
                ReusableTextFormField(controller: confirmPasswordController, hint: "Confirm Password"),
                SizedBox(height: 20,),
         ReusableElevatedButton(title: "Sign Up", onPressAction: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
