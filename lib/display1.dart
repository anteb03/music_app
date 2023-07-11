import 'package:aplikacija1/albums_songs/album1.dart';
import 'package:aplikacija1/albums_songs/album2.dart';
import 'package:aplikacija1/albums_songs/album3.dart';
import 'package:aplikacija1/albums_songs/album4.dart';
import 'package:aplikacija1/albums_songs/album5.dart';
import 'package:aplikacija1/persons_data/person1.dart';
import 'package:aplikacija1/persons_data/person2.dart';
import 'package:aplikacija1/persons_data/person3.dart';
import 'package:aplikacija1/persons_data/person4.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Display1 extends StatefulWidget {
  const Display1({super.key});

  @override
  State<Display1> createState() => _Display1State();
}

class _Display1State extends State<Display1> {
  List<FocusNode> __focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07),
                alignment: Alignment.center,
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            fillColor: Colors.white60,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: __focusNodes[0].hasFocus
                                  ? Colors.black54
                                  : Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(260)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(260)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'We recommend:',
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
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Album1(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 250)));
                                },
                                child: Playlists(
                                    label: 'Halid Beslić',
                                    image: AssetImage(
                                      'lib/albums_pictures/halidbeslic.jpg',
                                    )),
                              ),
                              SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Album3(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 250)));
                                },
                                child: Playlists(
                                    label: 'Šaban Šaulić',
                                    image: AssetImage(
                                        'lib/albums_pictures/sabansaulic.jpg')),
                              ),
                              SizedBox(width: 15),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Album2(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 250)));
                                }),
                                child: Playlists(
                                    label: 'Aco Pejović',
                                    image: AssetImage(
                                        'lib/albums_pictures/acopejovic.jpg')),
                              ),
                              SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Album4(),
                                          type: PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 250)));
                                },
                                child: Playlists(
                                    label: 'Sinan Sakić',
                                    image: AssetImage(
                                        'lib/albums_pictures/sinansakic.jpg')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'Most popular artists:',
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
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Person1(),
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Artists(
                                          image: AssetImage(
                                              'lib/persons_pictures/halidbeslicperson.jpg'),
                                          label: 'Halid Bešlić'),
                                    ),
                                    SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Person2(),
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Artists(
                                          image: AssetImage(
                                              'lib/persons_pictures/acopejovicperson.jpg'),
                                          label: 'Aco Pejović'),
                                    ),
                                    SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Person3(),
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Artists(
                                          image: AssetImage(
                                              'lib/persons_pictures/sinansakicperson.jpg'),
                                          label: 'Sinan sakić'),
                                    ),
                                    SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Person4(),
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Artists(
                                          image: AssetImage(
                                              'lib/persons_pictures/sabansaulicperson.jpg'),
                                          label: 'Šaban Šaulić'),
                                    ),
                                  ],
                                )))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'Older hits:',
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
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Album3(),
                                                type: PageTransitionType.fade,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Playlists(
                                          label: 'Šaban Šaulić',
                                          image: AssetImage(
                                              'lib/albums_pictures/sabansaulic.jpg')),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Album4(),
                                                type: PageTransitionType.fade,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Playlists(
                                          label: 'Sinan Sakić',
                                          image: AssetImage(
                                              'lib/albums_pictures/sinansakic.jpg')),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Album1(),
                                                type: PageTransitionType.fade,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      },
                                      child: Playlists(
                                          label: 'Halid Beslić',
                                          image: AssetImage(
                                            'lib/albums_pictures/halidbeslic.jpg',
                                          )),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Album2(),
                                                type: PageTransitionType.fade,
                                                duration: Duration(
                                                    milliseconds: 250)));
                                      }),
                                      child: Playlists(
                                          label: 'Aco Pejović',
                                          image: AssetImage(
                                              'lib/albums_pictures/acopejovic.jpg')),
                                    ),
                                  ],
                                )))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      child: Text(
                        'Hits to fall in love:',
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
                        child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: Album4(),
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 250)));
                                    },
                                    child: Playlists(
                                        label: 'Sinan Sakić',
                                        image: AssetImage(
                                            'lib/albums_pictures/sinansakic.jpg')),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: Album5(),
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 250)));
                                    },
                                    child: Playlists(
                                        label: 'Halid Beslić',
                                        image: AssetImage(
                                          'lib/albums_pictures/halidbeslic2.jpg',
                                        )),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: Album3(),
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 250)));
                                    },
                                    child: Playlists(
                                        label: 'Šaban Šaulić',
                                        image: AssetImage(
                                            'lib/albums_pictures/sabansaulic.jpg')),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: Album2(),
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 250)));
                                    }),
                                    child: Playlists(
                                        label: 'Aco Pejović',
                                        image: AssetImage(
                                            'lib/albums_pictures/acopejovic.jpg')),
                                  ),
                                ]))))
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Playlists extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const Playlists({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: image,
          width: 135,
          height: 135,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        )
      ],
    );
  }
}

class Artists extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const Artists({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 67,
          backgroundImage: image,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        )
      ],
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
