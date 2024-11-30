import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_flutter_auth/pages/auth_page.dart';
import 'package:new_flutter_auth/pages/login_page.dart';
import 'package:new_flutter_auth/pages/signup_page.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
        // home: SignupPage(),
    );

  }
}