import 'package:flutter/material.dart';
import 'package:new_flutter_auth/chap9_customscrollview_silvers/Widgets/silver_app_bar.dart';
import 'package:new_flutter_auth/chap9_customscrollview_silvers/Widgets/sliver_grid.dart';
import 'package:new_flutter_auth/chap9_customscrollview_silvers/Widgets/sliver_list.dart';
class C9Home extends StatelessWidget {
  const C9Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView - Silvers"),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers : <Widget> [
          const SliverAppBarWidget(),
          const SliverListWidget(),
          const SliverGridWidget(),

        ]
      ),
    );
  }
}
