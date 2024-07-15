import 'package:flutter/material.dart';
import 'package:unimall_app/features/user_auth/presentation/widgets/text_field_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("images/Unimallicon.png"),
              ),
              TextFieldInput(
                  textEditingController: emailController,
                  hintText: "Enter your email",
                  icon: Icons.email),
              TextFieldInput(
                  textEditingController: passwordController,
                  hintText: "Enter your password",
                  icon: Icons.password),
            ],
          ),
        ),
      ),
    );
  }
}
