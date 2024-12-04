import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_auth/pages/login_or_signup.dart';
import 'package:new_flutter_auth/project/screens/welcome_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),  // Stream of User?
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());  // Loading
          } else {
            if (snapshot.hasData) {
              // User is logged in
              return WelcomeScreen();  // Navigate to WelcomeScreen
            } else {
              return LoginAndSignUp();  // Show login/signup if no user
            }
          }
        },
      ),
    );
  }
}
