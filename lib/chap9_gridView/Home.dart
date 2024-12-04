import 'package:flutter/material.dart';
import 'package:new_flutter_auth/chap9_gridView/Widgets/gridview_builder.dart';
// import 'package:week11/chap9_gridView/Widgets/gridview_builder.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: const GridVewBuilderWidget()
      ),
    );
  }
}
