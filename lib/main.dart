import 'package:flutter/material.dart';

void main() {
  runApp(const TrafficLight());
}

class TrafficLight extends StatelessWidget {
  const TrafficLight({super.key});  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Light App',
      home: Traffic(),
    );
  }
}

class Traffic extends StatefulWidget {
  @override
  _TrafficState createState() => _TrafficState();
}

class _TrafficState extends State<Traffic> {
  double _currentlight = 0;
  
  void _changelight(){
    setState(() {
      _currentlight = (_currentlight+1)%3;
    });
  }

  double _getOpacity(int index){
    return _currentlight == index ? 1.0 : 0.3;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Light", style: TextStyle(color: Colors.yellow),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade300,
                      blurRadius: 10,
                      spreadRadius: 2
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(1),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.shade300,
                      blurRadius: 10,
                      spreadRadius: 2
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _getOpacity(2),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade300,
                      blurRadius: 10,
                      spreadRadius: 2
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _changelight, child: Text("เปลี่ยนสัญญาณไฟ"))
          ],
        ),
      )
    );
  }

}
