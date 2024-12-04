import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Parallax Effect',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        background: Image.asset(
          'assets/images/desk.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
