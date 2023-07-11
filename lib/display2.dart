import 'package:flutter/material.dart';

class Display2 extends StatefulWidget {
  const Display2({super.key});

  @override
  State<Display2> createState() => _Display2State();
}

class _Display2State extends State<Display2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10),
              ),
            ))
      ]),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
