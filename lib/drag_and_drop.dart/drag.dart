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
  int acceptedData1 = 5;
  int acceptedData2 = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Draggable")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DragTarget<int>(
              builder:
                  (
                    BuildContext context,
                    List<int?> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Draggable<int>(
                      data: 1,
                      feedback: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2),bottom: BorderSide(color: Colors.black, width: 2),)
                        ),
                        height: 110.0,
                        width: 100.0,
                        child: Center(
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            // spacing: 0,
                            children: [
                              for(int i = 0; i < acceptedData1; i++) 
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ),
                      childWhenDragging: SizedBox.square(dimension: 100,),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2),bottom: BorderSide(color: Colors.black, width: 2),)
                        ),
                        height: 110.0,
                        width: 100.0,
                        child: Center(
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            // spacing: 0,
                            children: [
                              for(int i = 0; i < acceptedData1; i++) 
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
              onAcceptWithDetails: (DragTargetDetails<int> details) {
                setState(() {
                  if (acceptedData2 > 0) {
                    acceptedData1 += details.data;
                    acceptedData2 -= details.data;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("The first bucket is empty!!!"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                });
              },
            ),
            DragTarget<int>(
              builder:
                  (
                    BuildContext context,
                    List<int?> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Draggable<int>(
                      data: 1,
                      feedback: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2),bottom: BorderSide(color: Colors.black, width: 2),)
                        ),
                        height: 110.0,
                        width: 100.0,
                        child: Center(
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            // spacing: 0,
                            children: [
                              for(int i = 0; i < acceptedData2; i++) 
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ),
                      childWhenDragging: SizedBox.square(dimension: 100,),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2),bottom: BorderSide(color: Colors.black, width: 2),)
                        ),
                        height: 110.0,
                        width: 100.0,
                        child: Center(
                          child: Column(
                            verticalDirection: VerticalDirection.up,
                            // spacing: 0,
                            children: [
                              for(int i = 0; i < acceptedData2; i++) 
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
              onAcceptWithDetails: (DragTargetDetails<int> details) {
                setState(() {
                  if (acceptedData1 > 0) {
                    acceptedData2 += details.data;
                    acceptedData1 -= details.data;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("The first bucket is empty!!!"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
