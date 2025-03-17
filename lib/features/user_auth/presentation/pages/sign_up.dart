import 'package:flutter/material.dart';
import 'package:unimall_app/features/user_auth/authentication_user.dart';
import 'package:unimall_app/features/user_auth/presentation/pages/bottomnav.dart';
import 'package:unimall_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/button.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/snack_bar.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/supportwidgets.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/text_field_input.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    
    @override
    // ignore: unused_element
    void despose(){
      super.dispose();
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
    }

    void signUpUser() async {
      String res = await AuthenticationUser().signUpUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        
      );
      //if sign up is successful user navigates to homepage else error message displayed
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

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.8,
                width: double.infinity,
                child: Image.asset("Images/logo.png"),
              ),
              TextFieldIn(
                textEditingController: nameController,
                hintText: "Create username",
                icon: Icons.person,
              ),
              TextFieldIn(
                textEditingController: emailController,
                hintText: "Enter email",
                icon: Icons.email,
              ),
              TextFieldIn(
                textEditingController: passwordController,
                hintText: "Enter password",
                isPass: true,
                icon: Icons.password,
              ),
              TheButton(onTab: signUpUser, text: "Sign Up"),
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppWidget.smallBoldTextFieledStyle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Log In",
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
