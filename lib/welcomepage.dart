import 'package:aplikacija1/display.dart';
import 'package:aplikacija1/fadeanimation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool _back = false;
  bool _back1 = false;
  late bool _loading = true;

  @override
  void initState() {
    _loading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                Container(
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    body: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: Center(
                        child: Column(
                          children: [
                            FadeAnimation(
                              delay: 1.2,
                              child: Lottie.network(
                                  "https://assets10.lottiefiles.com/packages/lf20_gzl797gs.json",
                                  height: 400,
                                  width: 350),
                            ),
                            FadeAnimation(
                              delay: 1.4,
                              child: Text(
                                "Welcome to community!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            FadeAnimation(
                              delay: 1.6,
                              child: Text(
                                'Start your journey!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    body: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.12),
                      child: Center(
                          child: Column(
                        children: [
                          FadeAnimation(
                            delay: 1.2,
                            child: Lottie.network(
                              'https://assets2.lottiefiles.com/packages/lf20_bfgchzaf.json',
                              height: 320,
                              width: 305,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          FadeAnimation(
                            delay: 1.4,
                            child: Text(
                              'Listen music everywhere for free in MusicLibrary!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                Container(
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    body: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.12),
                      child: Center(
                          child: Column(
                        children: [
                          FadeAnimation(
                            delay: 1.2,
                            child: Lottie.network(
                                'https://assets2.lottiefiles.com/packages/lf20_egIuUbkarh.json',
                                height: 320,
                                width: 305),
                          ),
                          SizedBox(height: 50),
                          FadeAnimation(
                            delay: 1.4,
                            child: Text(
                              'Create and publish your music project in MusicLibrary.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.88),
              child: Center(
                child: Container(
                  width: 250,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: Display(),
                                    type: PageTransitionType.fade,
                                    duration: Duration(microseconds: 450)));
                            setState(() {
                              _back = !_back;
                            });
                          },
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: _back ? Colors.white : Colors.grey,
                                fontSize: 16),
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: ColorTransitionEffect(
                              activeDotColor: Color.fromARGB(255, 43, 43, 43),
                              dotColor: Color.fromARGB(255, 248, 245, 245)),
                          onDotClicked: ((index) {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }),
                        ),
                        onLastPage
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Display(),
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              Duration(microseconds: 250)));
                                  setState(() {
                                    _back1 = !_back1;
                                  });
                                },
                                child: Text('DONE',
                                    style: TextStyle(
                                        color:
                                            _back1 ? Colors.white : Colors.grey,
                                        fontSize: 16)),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: Text('NEXT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
