import 'package:aplikacija1/albums_songs/album1.dart';
import 'package:aplikacija1/albums_songs/album5.dart';
import 'package:aplikacija1/albums_songs/single1.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Person1 extends StatefulWidget {
  const Person1({super.key});

  @override
  State<Person1> createState() => _Person1State();
}

class _Person1State extends State<Person1> {
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
                background: Image.asset(
                  'lib/persons_pictures/halidbeslicc.jpg',
                  fit: BoxFit.cover,
                  width: 500,
                ),
              ),
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 950,
                width: 450,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 370,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 350,
                          child: Text(
                            'Halid Bešlić',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 350,
                            child: ReadMoreText(
                              'Halid Bešlić is Bosnian folk singer. He started playing music, that is, singing as an amateur, as a primary school student, through various cultural and artistic societies, and he spent the longest time at the "Zijo Dizdarević" KUD. This lasted until he completed his military service in the former SFRY.'
                              'After returning from the army, he made his musical career more active through performances in famous Sarajevo and other restaurants, which lasted for about 5-6 years. He recorded his first single record in 1979, when his upward path to success and popularity on the Bosnian and Balkan music scene began. The result of his work from 1979 to 2003 is 16 recorded albums, as well as two live albums. ',
                              trimLines: 1,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more.',
                              trimExpandedText: 'Show less.',
                              lessStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              moreStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            'Albums:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Row(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Album5(),
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 250)));
                              },
                              child: Playlists(
                                  label: 'Otrov',
                                  image: AssetImage(
                                    'lib/albums_pictures/halidbeslic2.jpg',
                                  )),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Album1(),
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 250)));
                              },
                              child: Playlists(
                                  label: 'Halid 08',
                                  image: AssetImage(
                                    'lib/albums_pictures/halidbeslic.jpg',
                                  )),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            'Singles:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Row(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: Single1(),
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 250)));
                              },
                              child: Playlists(
                                  label: 'Pjesma samo o njoj',
                                  image: AssetImage(
                                    'lib/albums_pictures/halidbeslic3.jpg',
                                  )),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            'News & more:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: GestureDetector(
                            onTap: () {
                              openUrl(
                                  'https://www.index.hr/tag/88890/halid-beslic.aspx');
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
