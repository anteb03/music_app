import 'package:aplikacija1/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    var d = Duration(seconds: 7);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 88, 88, 88),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.network(
                'https://assets2.lottiefiles.com/private_files/lf30_k2RVBb.json',
                width: 150,
                height: 150),
          ],
        )),
      ),
    );
  }
}
