import 'package:flutter/material.dart';
import 'package:new_flutter_auth/chap9_gridView/Widgets/gridview_builder.dart';
import 'package:new_flutter_auth/chap9_stack/StackHome.dart';
import 'package:new_flutter_auth/pages/delete_user.dart';
import 'package:new_flutter_auth/pages/update_userDetail.dart';
import 'package:new_flutter_auth/pages/user_detail.dart';
import 'package:new_flutter_auth/week12/Chap10Home.dart';

class AllButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Buttons"),
        backgroundColor: const Color(0xFF212325),
      ),
      body: Container(
        color: const Color(0xFF212325),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridVewBuilderWidget()),
                );
              },
              buttonText: "View All Items",
            ),
            const SizedBox(height: 16),
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StackHome()),
                );
              },
              buttonText: "Chap 9 Stack",
            ),
            const SizedBox(height: 16),
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chap10Home()),
                );
              },
              buttonText: "Chap 10",
            ),
            const SizedBox(height: 16),
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserDetailsPage()),
                );
              },
              buttonText: "User Detail",
            ),
            const SizedBox(height: 16),
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateUserDetailsPage()),
                );
              },
              buttonText: "User Detail Update",
            ),
            const SizedBox(height: 16),
            AnimatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteUserPage()),
                );
              },
              buttonText: "User Delete",
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AnimatedButton({required this.onPressed, required this.buttonText});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onTapDown: (_) {
        _controller.forward(); // Scale down and reduce opacity
      },
      onTapUp: (_) {
        _controller.reverse(); // Scale back up and restore opacity
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFE57742),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
