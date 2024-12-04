import 'package:flutter/material.dart';

class Gesture extends StatefulWidget {
  const Gesture({super.key});

  @override
  State<Gesture> createState() => _HomeState();
}

class _HomeState extends State<Gesture> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              Divider(color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print("onTap");
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print("Double tap");
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print("Long press");
        _displayGestureDetected('onLongPress');
      },
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.lightGreen.shade100,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text("$_gestureDetected"),
          ],
        ),
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable<int>(
      child: Column(
        children: [
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text("Drag Me Below to change Color"),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        setState(() {
          _paintedColor = Color(colorValue); // Update the painted color here
        });
      },
      builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectedData) {
        return acceptedData.isEmpty
            ? Text(
          "Drag to and see me color Change",
          style: TextStyle(color: _paintedColor),
        )
            : Text(
          "Painting Color : ${acceptedData[0]}",
          style: TextStyle(color: Color(acceptedData[0])),
        );
      },
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }
}
