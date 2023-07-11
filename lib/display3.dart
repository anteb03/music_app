import 'package:aplikacija1/display3/mysong.dart';
import 'package:aplikacija1/display3/playlist.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Display3 extends StatefulWidget {
  const Display3({super.key});

  @override
  State<Display3> createState() => _Display3State();
}

class _Display3State extends State<Display3> {
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
                    top: MediaQuery.of(context).size.height * 0.08),
                child: Center(
                  child: Column(children: [
                    Container(
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _dd(context);
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'My playlists:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'My music projects:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
              ),
            ))
      ]),
    );
  }

  void _dd(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.9),
                  ])),
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 7,
                    width: 25,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Playlista(),
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 200)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      width: 370,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make a new playlist.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Add songs what you like to be there.',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Mysongs(),
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 200)));
                    },
                    child: Container(
                      width: 370,
                      child: Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Make a new music project.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Add your .mp3 file(s) there.',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
