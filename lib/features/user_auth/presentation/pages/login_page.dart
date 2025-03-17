import 'package:flutter/material.dart';
import 'package:unimall_app/features/user_auth/authentication_user.dart';
import 'package:unimall_app/features/user_auth/presentation/pages/bottomnav.dart';
import 'package:unimall_app/features/user_auth/presentation/pages/sign_up.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/button.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/snack_bar.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/supportwidgets.dart';

import 'package:unimall_app/features/user_auth/presentation/widgets/text_field_input.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

        @override
    // ignore: unused_element
    void despose(){
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
    }
    
      void loginUser() async {
      String res = await AuthenticationUser().loginUser(
        email: emailController.text,
        password: passwordController.text,
        
      );
      //if log in is successful user navigates to homepage else error message displayed
      if (res == "Success!") {
        setState(() {
          isLoading = true;
        });
        //navigate to homepage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Bottomnav(),
          ),
        );
      }else {
        setState(() {
          isLoading = false;
        });
        //displays error
        showSnackBar(context, res);
      }
    }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.7,
                width: double.infinity,
                child: Image.asset("Images/logo.png"),
              ),
              TextFieldIn(
                textEditingController: emailController,
                hintText: "Enter email",
                icon: Icons.email,
              ),
              TextFieldIn(
                isPass: true,
                textEditingController: passwordController,
                hintText: "Enter password",
                icon: Icons.lock,
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: AppWidget.smallBoldTextFieledStyle(),
                  ),
                ),
              ),
              TheButton(onTab: loginUser, text: "Log In"),
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account? ",
                    style: AppWidget.smallBoldTextFieledStyle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
