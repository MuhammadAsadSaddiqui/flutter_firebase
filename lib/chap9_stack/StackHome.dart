import 'package:flutter/material.dart';
import 'package:new_flutter_auth/chap9_stack/Widgets/stack.dart';
import 'package:new_flutter_auth/chap9_stack/Widgets/stack_favorite.dart';

class StackHome extends StatelessWidget {
  const StackHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Chap 9 Stack",
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor:  Color(0xFFE57734),

      ),
      body: SafeArea(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index){
              if(index.isEven){
                return StackWidget();
              }
              else{
                return const StackFavoriteWidget();
              }
            },
          )
      ),
    );
  }
}

