import 'package:flutter/material.dart';
import 'package:new_flutter_auth/chap9_gridView/Widgets/grid_icons.dart';

class GridVewBuilderWidget extends StatelessWidget {
  const GridVewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridIcons.getIconList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF212325),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Text(
          'Grid View Builder',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        itemCount: _iconList.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.lightGreen.shade50,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[index],
                  size: 48.0,
                  color: Colors.lightGreen,
                ),
                const Divider(),
                Text(
                  'Index $index',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
