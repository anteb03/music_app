import 'package:aplikacija1/persons_data/person3.dart';
import 'package:aplikacija1/songs/albumsongs4.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';

class Album4 extends StatefulWidget {
  const Album4({super.key});

  @override
  State<Album4> createState() => _Album4State();
}

class _Album4State extends State<Album4> {
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.grey.withOpacity(0),
                        Colors.grey.withOpacity(.4),
                        Colors.grey.withOpacity(.8),
                        Colors.grey.withOpacity(.4),
                        Colors.grey.withOpacity(.15),
                      ])),
                  child: Center(
                    child: Playlists(
                        image: AssetImage('lib/albums_pictures/sinansakic.jpg'),
                        label: 'Pijem na eks'),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 950,
                width: 450,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.grey.withOpacity(.15),
                      Colors.grey.withOpacity(0),
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(1),
                    ])),
                child: Container(
                  alignment: Alignment.center,
                  width: 370,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 360,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Person3(),
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              Duration(milliseconds: 250)));
                                },
                                child: Row(
                                  children: [
                                    Artists(
                                        image: AssetImage(
                                            'lib/persons_pictures/sinansakicperson.jpg')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sinan Sakić',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(children: [
                                GestureDetector(
                                  child: Icon(
                                    Icons.shuffle,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: AlbumSongs4(),
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 250)));
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: 350,
                          child: Text(
                            'Songs in album:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 360,
                          decoration: BoxDecoration(
                            color: Color(0xFF30314D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(right: 12, left: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  '1.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunce moje',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(children: [
                                        Text('Pijem na eks',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('-',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('3:32',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                      ])
                                    ])
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 360,
                          decoration: BoxDecoration(
                            color: Color(0xFF30314D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(right: 12, left: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  '2.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pijem na eks',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(children: [
                                        Text('Pijem na eks',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('-',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('3:08',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                      ])
                                    ])
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 350,
                          child: Text(
                            'More about album:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 350,
                          child: GestureDetector(
                            onTap: () {
                              openUrl(
                                  'https://genius.com/albums/Halid-beslic/08');
                            },
                            child: Text(
                              'Click link there',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]))
          ],
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: image,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Artists extends StatelessWidget {
  final ImageProvider image;
  const Artists({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: image,
        ),
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
