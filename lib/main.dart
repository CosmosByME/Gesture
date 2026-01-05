import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Translate')),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _offset = _offset + details.delta;  // This accumulates properly
            });
          },
          child: Transform(
            transform: Matrix4.identity()..translateByDouble(_offset.dx, _offset.dy, 0, 1)..scaleByDouble(0.1, 0.1, 1, 1),
            child: Container(
              width: 900,
              height: 900,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "Drag Me!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}