import 'package:flutter/material.dart';
import 'package:new_flutter_auth/pages/login_page.dart';
import 'package:new_flutter_auth/pages/signup_page.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({super.key});

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool isLogin = true;

  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(onPressed: togglePage); // Pass the togglePage method
    } else {
      return SignupPage(
          onPressed: togglePage); // Assuming SignupPage requires onPressed too
    }
  }
}
