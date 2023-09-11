import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DraggableContainer(),
      ),
    );
  }
}

class DraggableContainer extends StatefulWidget {
  const DraggableContainer({super.key});

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  double _x = 150; //posição x 
  double _y = 350; // posição y 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _y,
          left: _x,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                _x += details.delta.dx;
                _y += details.delta.dy;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow( 
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 2),
                  ),
                ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
