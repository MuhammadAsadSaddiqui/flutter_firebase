// import 'package:flutter/material.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   Offset _startLastOffset = Offset.zero;
//   Offset _lastOffset = Offset.zero;
//   Offset _currentOffset = Offset.zero;
//   double _lastScale = 1.0;
//   double _currentScale = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           _transformScaleAndTranslate(),
//           _positionedStatueBar(context),
//         ],
//       ),
//       onScaleStart: _onScaleStart,
//       onScaleUpdate: _onScaleUpdate,
//       onDoubleTap: _onDoubleTap,
//       onLongPress: _onLonfPress,
//     );
//   }
// }
//
// Transform _transformMatrix4() {
//   return Transform(
//     transform: Matrix4.identity()
//       ..scale(_currentScale, _currentScale)
//       ..translate(_currentOffset.dx, _currentOffset.dy),
//     alignment: FractionalOffset.center,
//     child: Image(image: AssetImage("assets/images/elephant.jpg")),
//   );
// }
//
// Positioned _positionedStatusBar(BuildContext context){
//   return Positioned(
//       top: 0.0,
//       width: MediaQuery.of(context).size.width,
//       child: Container(
//         color: Colors.white54,
//         height: 50.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//       Text("Scale: ${_currentScale.toStringAsFixed(4)}")
//         ,Text("Current : ${_currentOffset"),
//           ],
//         ),
//
//       )
//   );
// }
//
// void _onScaleStart(ScaleStartDetails details){
//   print("ScaleStartDetails : $details");
//
//   _startLastOffset = details.focalPoint;
// }